module UsersHelper

  def user_reviews_message
    if current_user.reviews.empty?
      content_tag(:b, "You have not posted any reviews")
    else
      content_tag(:b, "Your reviews: ")
    end
  end

  def link_to_delete
    if @user == current_user
      link_to("Delete Account", @user, method: :delete, data: { confirm: "Delete account and all reviews?" })
    end
  end
  
end
