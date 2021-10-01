class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book, presence: true
  validates :content, presence: true 
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6} 
  validates :book, uniqueness: { scope: :user, message: "You have already reviewed this book"  }

  scope :newest, -> {order(created_at: :desc)}
  # scope :order, ->

  def self.for_book(book)
    where(book_id: book).order(ratings)
  end

end
