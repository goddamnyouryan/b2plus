class PagesController < ApplicationController
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
end
