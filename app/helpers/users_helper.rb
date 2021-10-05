module UsersHelper

  def review_message
    if current_user.reviews.empty?
      content_tag(:b, "You have not reviewed any books")
    else
      content_tag(:b, "Here are the books you have reviewed: ")
    end
  end
  
end
