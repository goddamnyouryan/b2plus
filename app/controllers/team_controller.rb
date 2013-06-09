class TeamController < ApplicationController
  before_filter :find_team, only: [:edit, :update, :destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.create params[:team]
    if @team.save
      redirect_to admin_path, notice: 'New Team member added!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update_attributes params[:team]
    if @team.save
      redirect_to admin_path, notice: 'Team member updated'
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to admin_path, notice: 'Team member deleted.'
  end

  private

  def find_team
    @team = Team.find params[:id]
  end
end
