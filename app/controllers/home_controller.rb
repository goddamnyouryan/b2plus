class HomeController < ApplicationController
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
