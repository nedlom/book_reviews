class Book < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews


  # scope methods in two ways 
  # class level methods
  # change the scope of collections (random -> ord, all -> some) 
  # call in controller or view to change display
  def self.alpha
    order(title: :asc)
  end

  # avg rating
  # Book.joins(:reviews).group(:id).order('avg(ratings) desc')
  scope -> {}

  validates :title, presence: true, uniqueness: true
  def genre_attributes=(attributes)
    if !attributes[:name].empty?
      self.genre = Genre.find_or_create_by(name: attributes[:name].titleize)
    end
  end

  def title_and_author
    "#{self.title} - #{self.author}"
  end

   

end
