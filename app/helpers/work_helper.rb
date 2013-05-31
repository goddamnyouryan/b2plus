module WorkHelper

  def background_images(work)
    "background-image: url('#{work.foreground_image}'), url('#{work.middle_image}'), url('#{work.background_image}');"
  end
end
