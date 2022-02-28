class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.references :member, null: false, foreign_key: true
      t.string :file_name
      t.string :download_url

      t.timestamps
    end
  end
end
