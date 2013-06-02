class AddFieldsToHome < ActiveRecord::Migration
  def change
    add_column :homes, :mp4, :string
    add_column :homes, :ogg, :string
    add_column :homes, :poster, :string
    remove_column :homes, :video
  end
end
