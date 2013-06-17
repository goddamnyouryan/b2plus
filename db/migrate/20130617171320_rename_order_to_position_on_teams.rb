class RenameOrderToPositionOnTeams < ActiveRecord::Migration
  def up
    rename_column :teams, :order, :position
  end

  def down
  end
end
