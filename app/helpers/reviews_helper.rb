module ReviewsHelper

  def created_at(review)
    review.created_at.strftime("%A, %b %e %Y, at %l:%M %p")
  end

  def display_header_for_index
    if params[:book_id]
      book = Book.find_by(id: params[:book_id]).title_and_author
      content_tag(:h2, "Review index for: #{book}")
    else
      content_tag(:h2, "Review Index")
    end
  end

  def display_header_for_new
    if params[:book_id]
      book = Book.find_by(id: params[:book_id]).title_and_author
      content_tag(:h2, "Reviewing: #{book}")
    else
      content_tag(:h2, "Write A Review")
    end
  end

  def hidden_book
    if params[:book_id]
      hidden_field(:review, :book_id)
    else
      collection_select(:review, :book_id, Book.all, :id, :title_and_author, include_blank: "Select A Book To Review")
    end
  end

  def links_to_edit_and_delete
    if current_user == @review.user
      link_to("Edit Review", edit_review_path(@review)) +
      tag('br') +
      link_to("Delete Review", @review, method: :delete)
    end
  end

end
