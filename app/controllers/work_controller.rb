class WorkController < ApplicationController
  before_filter :find_work, only: [:edit, :update, :destroy]
  before_filter :password_protect

  def new
    @work = Work.new
  end

  def create
    @work = Work.create params[:work]
    if @work.save
      redirect_to admin_path, notice: 'New Work created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @work.update_attributes params[:work]
    if @work.save
      redirect_to admin_path, notice: 'Work updated.'
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to admin_path, notice: 'Work deleted.'
  end

  def sort
    params[:work].each_with_index do |id, index|
      Work.update_all({position: index + 1}, { id: id })
    end
    render nothing: true
  end

  private

  def find_work
    @work = Work.find params[:id]
  end
end
