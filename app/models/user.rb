class User < ApplicationRecord
  has_many :reviews
  has_many :books, through: :reviews
  
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # scope :try, -> {join(:reviews).group(:id).order('count(reviews.id) desc').limit(1)} }

  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:nickname]) do |u|
      u.email = auth[:info][:email]  
      u.password = SecureRandom.hex
    end
  end

end
