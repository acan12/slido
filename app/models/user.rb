class User < ActiveRecord::Base
  acts_as_liker
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :user_name, presence: true, length: { minimum: 4, maximum: 12 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :presentations, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :avatar, 
                styles: { medium: '152x152#' },
                :default_url => 'default-avatar.jpg'
  
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
