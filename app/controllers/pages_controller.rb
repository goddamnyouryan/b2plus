class PagesController < ApplicationController
  def index
  end

  def connect
  end

  def admin
  end

  def contact
    sleep 3
    render nothing: true
  end
end
