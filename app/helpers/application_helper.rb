module ApplicationHelper

  def image_url(file)
    string = request.protocol + request.host_with_port + path_to_image(file)
    string.html_safe
  end
end
