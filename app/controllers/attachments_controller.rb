require "google/cloud/storage"
require 'open-uri'
class AttachmentsController < ApplicationController
  before_action :find_member, only: %i[new create download]

  def new
    @attachment = @member.attachments.new
  end

  def create
    return redirect_to request.referer if params[:upload_file].blank?

    attachment = @member.attachments.new(
      file_name: file_name,
      storage_path: "upload_file/#{@member.name}/#{Time.current.to_i}_#{file_name}",
    )

    return render :new unless attachment.valid?

    bucket = find_bucket
    upload_result = bucket.create_file(params[:upload_file].path, attachment.storage_path)

    if upload_result && attachment.save!
      redirect_to members_path, notice: "已成功上傳 #{file_name}"
    else
      redirect_to members_path, notice: "上傳 #{file_name} 失敗，請再次上傳"
    end
  end

  def download
    attachment = @member.attachments.find(params[:id])
    bucket = find_bucket
    file = bucket.file(attachment.storage_path)
    file_data = open(file.signed_url).read
    send_data(file_data, filename: attachment.file_name)
  end

  private

  def find_member
    @member = Member.find_by(id: params[:member_id])
  end

  def file_name
    params[:upload_file].original_filename
  end

  def find_bucket
    storage = Google::Cloud::Storage.new(
      project_id: ENV['GOOGLE_CLOUD_PROJECT'],
      credentials: ENV['GOOGLE_CLOUD_CREDENTIALS']
    )
    storage.bucket ENV['MY_BUCKET']
  end
end
