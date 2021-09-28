class Book < ApplicationRecord
  belongs_to :genre
  

  def genre_attributes=(attributes)
    if !attributes[:name].empty?
      self.genre = Genre.find_or_create_by(name: attributes[:name].titleize)
    end
  end

   

end
