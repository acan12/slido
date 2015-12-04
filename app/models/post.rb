class Post < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :presentation

  validates :presentation_id, presence: true
  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: { maximum: 240 }

  has_attached_file :image, styles: { 
          small:  PPCLIP_APP_SMALL,
          medium: PPCLIP_APP_MEDIUM,
          big:    PPCLIP_APP_BIG      }
          
  # 640x360
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
