class AddArchiveToVideos < ActiveRecord::Migration
  def change
    add_column :works, :archive, :boolean, null: false, default: false
  end
end
