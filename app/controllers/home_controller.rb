class HomeController < ApplicationController
  def index
    @home = Home.first
    @work = Work.order('position asc')
    @teams = Team.all
  end

  def admin
    @work = Work.all
    @team = Team.all
    @home = Home.first
  end

  def contact
    UserMailer.contact_form(params).deliver
    render nothing: true
  end

  def edit
    @home = Home.find params[:id]
  end

  def update
    @home = Home.find params[:id]
    @home.update_attributes params[:home]
    if @home.save
      redirect_to admin_path, notice: 'Homepage updated'
    else
      render :edit
    end
  end
end
