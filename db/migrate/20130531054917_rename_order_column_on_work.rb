class RenameOrderColumnOnWork < ActiveRecord::Migration
  def up
    rename_column :works, :order, :position
  end

  def down
  end
end
