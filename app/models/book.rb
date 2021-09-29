class Book < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews

  def genre_attributes=(attributes)
    if !attributes[:name].empty?
      self.genre = Genre.find_or_create_by(name: attributes[:name].titleize)
    end
  end

   

end
