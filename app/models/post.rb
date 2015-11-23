class Post < ActiveRecord::Base
  acts_as_votable
  
  belongs_to :user
  belongs_to :presentation
  has_many :comments, dependent: :destroy

  validates :presentation_id, presence: true
  validates :user_id, presence: true
  validates :image, presence: true
  # validates :caption, length: { minimum: 3, maximum: 300 }

  has_attached_file :image, styles: { 
          small:  PPCLIP_APP_SMALL,
          medium: PPCLIP_APP_MEDIUM,
          big:    PPCLIP_APP_BIG      }
          
  # validates_attachment :image, dimensions: { width: 700, height: 400 }  # 640x360
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
