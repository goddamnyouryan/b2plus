class Home < ActiveRecord::Base
  attr_accessible :title, :intro, :mp4, :ogg, :poster
end
