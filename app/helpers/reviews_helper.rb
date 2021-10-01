module ReviewsHelper

  def created_at(review)
    review.created_at.strftime("%A, %b %e %Y, at %l:%M %p")
  end

  def display_header_for_index
    if params[:book_id]
      heading = Book.find_by(id: params[:book_id]).title_and_author
      content_tag(:h2, "Review index for: #{heading}")
    else
      content_tag(:h2, "Review Index")
    end
  end

end
