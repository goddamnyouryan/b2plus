class PagesController < ApplicationController
  def index
  end

  def connect
  end

  def admin
  end

  def contact
    UserMailer.contact_form(params).deliver
    render nothing: true
  end
end
