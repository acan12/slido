class Presentation < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy  
  
  acts_as_likeable
  
  has_permalink :title

  validates :user_id, presence: true
  validates :title, presence: true

  after_create :generate_and_save_permalink
  
  # permalink generate by random
  def generate_and_save_permalink
    self.update(permalink: SecureRandom.base64(8))
    self.permalink
  end
  
  def self.find_by_id_or_permalink(id)
    return Presentation.find(id) unless id.to_s.match(/[a-z]/i).present?
    return Presentation.find_by_permalink(id) if id.to_s.match(/[a-z]/i).present?
  end
end
