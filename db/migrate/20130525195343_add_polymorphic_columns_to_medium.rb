class AddPolymorphicColumnsToMedium < ActiveRecord::Migration
  def change
    add_column :media, :imageable_type, :string
    rename_column :media, :team_id, :imageable_id
  end
end
