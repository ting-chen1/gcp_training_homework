class SetMultipleLanguageColumnToMembers < ActiveRecord::Migration[6.0]
  def change
    rename_column :members, 'name', 'name_zh-TW'
    add_column :members, 'name_en', :string
  end
end
