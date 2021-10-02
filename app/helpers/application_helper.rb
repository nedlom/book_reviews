module ApplicationHelper

  def links
    if current_user
      render partial: 'layouts/links'
    end
  end

end
