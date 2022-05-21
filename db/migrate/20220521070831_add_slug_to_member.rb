class AddSlugToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :slug, :string
  end
end
