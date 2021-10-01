class Genre < ApplicationRecord
  has_many :books

  scope :alpha, -> {order(:name)}

end
