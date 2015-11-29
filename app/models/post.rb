class Post < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :presentation

  validates :presentation_id, presence: true
  validates :user_id, presence: true
  validates :image, presence: true
  # validates :caption, length: { minimum: 3, maximum: 100 }

  has_attached_file :image, styles: { 
          small:  PPCLIP_APP_SMALL,
          medium: PPCLIP_APP_MEDIUM,
          big:    PPCLIP_APP_BIG      }
          
  # 640x360
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validate :check_dimensions
  
  # def check_dimensions
  #   temp_file = image.queued_for_write[:original]
  #   unless temp_file.nil?
  #     dimensions = Paperclip::Geometry.from_file(temp_file)
  #     width = dimensions.width
  #     height = dimensions.height
  # 
  #     if width < 640 && height < 360
  #       errors[''] << " dimensions are too small. For a good quality background please upload a larger image. Minimum width: 640px, minimum height: 360px"
  #     end
  #   end
  # end
end
