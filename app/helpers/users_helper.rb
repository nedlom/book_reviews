module UsersHelper

  def user_reviews_message
    if current_user.reviews.empty?
      content_tag(:b, "You have not posted any reviews")
    else
      content_tag(:b, "Your reviews: ")
    end
  end
  
end
