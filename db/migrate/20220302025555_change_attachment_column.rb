class ChangeAttachmentColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :attachments, :download_url, :storage_path
  end
end
