class AddTypeToMedium < ActiveRecord::Migration
  def change
    add_column :media, :type, :string
  end
end
