class AttachmentsController < ApplicationController
  before_action :find_member, only: %i[new create]

  def new
    @attachment = @member.attachments.new
  end

  def create
    if @member.attachments.create(file_name: file_name)
      redirect_to members_path, notice: "已成功上傳 #{file_name}"
    else
      render :new
    end
  end

  private

  def find_member
    @member = Member.find_by(id: params[:member_id])
  end

  def file_name
    params[:upload_file].original_filename
  end
end
