class Medium < ActiveRecord::Base
  attr_accessible :team_id, :type, :attachment_file_name, :attachment_file_type,
                  :attachment_content_type, :attachment_file_size, :attachment_updated_at

  self.inheritance_column = nil

  belongs_to :team

  has_attached_file :attachment, styles: { },
                    storage: :s3, s3_credentials: "#{Rails.root}/config/s3.yml",
                    path: ':id/:style.:extension'
end
