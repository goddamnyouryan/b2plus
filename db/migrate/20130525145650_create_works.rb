class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.integer :order
      t.string :mp4
      t.string :ogg

      t.timestamps
    end
  end
end
