module UsersHelper
  def who_to_follow_list(follower)
    res = ''

    followers_list = current_user.followers.pluck(:followed_id)

    unless followers_list.include?(follower.id) || current_user.id == follower.id
      res << "<div class='d-flex'>"
      res <<   "<p class='follow-picture'>#{follower.photo}</p>"
      res <<   "<div class='d-flex flex-column my-auto'>"
      res <<     "<p>#{follower.full_name}</p>"
      res <<   "</div>"
      res << "</div>"
    end
    res.html_safe 
  end

  def user_photo
  end

  def interact_buttons(user)
    if current_user.followers.pluck(:followed_id).include?(user.id)
      link_to user_unfollow_path(user) do
        '<button class="mx-2 interact-button"><i class="fas fa-minus"></i></button>'.html_safe
      end
    elsif user == current_user
      nil
    else
      link_to user_follow_path(user) do
        '<button class="mx-2 interact-button"><i class="fas fa-plus"></i></button>'.html_safe
      end
    end
  end
end
