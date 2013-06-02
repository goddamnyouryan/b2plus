class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.text :intro
      t.string :video

      t.timestamps
    end
  end
end
