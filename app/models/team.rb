class Team < ActiveRecord::Base
  attr_accessible :body, :name, :order, :thumb, :hover, :title

  attr_accessor :thumb, :hover

  has_many :media, as: :imageable

  after_save :create_thumb, if: :thumb?
  after_save :create_hover, if: :hover?

  default_scope order('position ASC')

  def thumb?
    self.thumb.present?
  end

  def hover?
    self.hover.present?
  end

  def thumb_image
    media.where(type: 'thumb').first.attachment
  end

  def hover_image
    media.where(type: 'hover').first.attachment
  end

  private

  def create_thumb
    find_or_create_medium('thumb', thumb)
  end

  def create_hover
    find_or_create_medium('hover', hover)
  end

  def find_or_create_medium(type, file)
    medium = Medium.find_or_create_by_imageable_id_and_imageable_type_and_type(self.id, 'Team', type)
    medium.attachment = file
    medium.save
  end
end
