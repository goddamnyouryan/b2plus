class AddTeamIdToMedium < ActiveRecord::Migration
  def change
    add_column :media, :team_id, :integer
  end
end
