class AddTitleToHome < ActiveRecord::Migration
  def change
    add_column :homes, :title, :string
  end
end
