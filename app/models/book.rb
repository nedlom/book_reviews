class Book < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validate :not_a_duplicate

  scope :high_ratings, -> {having()}

  
  # if there is already a book with that title && author, throw an error
  def not_a_duplicate
    book = Book.find_by(title: title, author: author)
    if !!book && book != self
      errors.add(:book, 'is already in the book index.')
    end
  end
  # scope methods in two ways 
  # class level methods
  # change the scope of collections (random -> ord, all -> some) 
  # call in controller or view to change display
  # def self.alpha
  #   order(title: :asc)
  # end

  # avg rating
  # Book.joins(:reviews).group(:id).order('avg(ratings) desc')
  # scope -> {}





  def genre_attributes=(attributes)
    if !attributes[:name].empty?
      self.genre = Genre.find_or_create_by(name: attributes[:name].titleize)
    end
  end

  def title_and_author
    "#{self.title} - #{self.author}"
  end

end
