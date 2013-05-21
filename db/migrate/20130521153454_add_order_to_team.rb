class AddOrderToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :order, :integer, { null: false, default: 0 }
  end
end
