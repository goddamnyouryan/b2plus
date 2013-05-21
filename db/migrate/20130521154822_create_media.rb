class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.attachment :attachment
      t.timestamps
    end
  end
end
