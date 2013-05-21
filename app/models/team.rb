class Team < ActiveRecord::Base
  attr_accessible :body, :name, :title, :order, :thumb, :hover

  attr_accessor :thumb, :hover

  has_many :media

  after_save :create_thumb, if: :thumb?
  after_save :create_hover, if: :hover?

  def thumb?
    self.thumb.present?
  end

  def hover?
    self.hover.present?
  end

  def thumb_image
    media.where(type: 'thumb').first.attachment(:team)
  end

  def hover_image
    media.where(type: 'hover').first.attachment(:team)
  end

  private

  def create_thumb
    find_or_create_medium('thumb', thumb)
  end

  def create_hover
    find_or_create_medium('hover', hover)
  end

  def find_or_create_medium(type, file)
    medium = Medium.find_or_create_by_team_id_and_type(self.id, type)
    medium.attachment = file
    medium.save
  end
end
