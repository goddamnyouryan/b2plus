class Work < ActiveRecord::Base
  attr_accessible :description, :mp4, :ogg, :order, :title,
                  :background, :middle, :foreground, :thumb

  attr_accessor :background, :middle, :foreground, :thumb

  has_many :media, as: :imageable

  after_save :create_background, if: :background?
  after_save :create_middle, if: :middle?
  after_save :create_foreground, if: :foreground?
  after_save :create_thumb, if: :thumb?

  def background?
    self.background.present?
  end

  def middle?
    self.middle.present?
  end

  def foreground?
    self.foreground.present?
  end

  def thumb?
    self.foreground.present?
  end

  def background_image
    medium = media.where(type: 'background')
    if medium.present?
      medium.first.attachment
    end
  end

  def middle_image
    medium = media.where(type: 'middle')
    if medium.present?
      medium.first.attachment
    end
  end

  def foreground_image
    medium = media.where(type: 'foreground')
    if medium.present?
      medium.first.attachment
    end
  end

  private

  def create_background
    find_or_create_medium('background', background)
  end

  def create_middle
    find_or_create_medium('middle', middle)
  end

  def create_foreground
    find_or_create_medium('foreground', foreground)
  end

  def create_thumb
    find_or_create_medium('thumb', thumb)
  end

  def find_or_create_medium(type, file)
    medium = Medium.find_or_create_by_imageable_id_and_imageable_type_and_type(self.id, 'Work', type)
    medium.attachment = file
    medium.save
  end
end
