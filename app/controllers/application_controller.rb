class ApplicationController < ActionController::Base
  protect_from_forgery

  def password_protect
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == 'tv13br@vo'
    end
  end
end
