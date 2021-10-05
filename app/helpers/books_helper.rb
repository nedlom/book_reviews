module BooksHelper

  def book_reviews_message
    if @book.reviews.empty?
      content_tag(:b, "#{@book.title_and_author} has not been reviewed")
    end
  end

end
