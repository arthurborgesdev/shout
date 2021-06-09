module UsersHelper
  def who_to_follow_list(follower)
    res = ''

    followers_list = current_user.followers.pluck(:followed_id)

    unless followers_list.include?(follower.id) || current_user.id == follower.id
      follower_picture = link_to follower do
        "<p class='follow-picture'>#{follower.photo}</p>".html_safe
      end 

      res << "<div class='d-flex'>"
      res <<   "#{follower_picture}"
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

  def upload_pictures(user)
    res = ''

    if current_user == user
      upload_picture = link_to "" do
        '<div class="mx-2 my-2 upload-picture-button"><i class="fas fa-portrait fa-lg"></i></div>'.html_safe
      end
      upload_banner = link_to "" do
        '<div class="mx-2 my-2 upload-banner-button"><i class="fas fa-tv fa-lg"></i></div>'.html_safe
      end
      res << upload_picture
      res << upload_banner
    end
    res.html_safe
  end

  def remove_yell(user, yell)
    if current_user == user 
      link_to yell_path(yell.id), method: :delete do
        '<i class="fas fa-trash fa-lg"></i>'.html_safe
      end
    end
  end
end
