module UsersHelper
  def who_to_follow_list(follower)
    res = ''

    followers_list = current_user.followers.pluck(:followed_id)

    unless followers_list.include?(follower.id) || current_user.id == follower.id
      follower_picture = link_to follower do
        follow_picture(follower)
      end

      res << "<div class='d-flex'>"
      res << follower_picture.to_s
      res << "<div class='d-flex flex-column my-auto'>"
      res << "<p>#{follower.full_name}</p>"
      res << '</div>'
      res << '</div>'
    end
    res.html_safe
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

  def profile_picture(user)
    if user.photo.file.nil?
      img = 'https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg'
      "<img src='#{img}' class='profile-picture'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='profile-picture'>".html_safe
    end
  end

  def user_photo(user)
    if user.photo.file.nil?
      img = 'https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg'
      "<img src='#{img}' class='yell-picture'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='yell-picture'>".html_safe
    end
  end

  def yell_author_photo(yell)
    user = yell.author
    if user.photo.file.nil?
      img = 'https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg'
      "<img src='#{img}' class='yell-picture'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='yell-picture'>".html_safe
    end
  end

  def cover_image(user)
    if user.cover_image.file.nil?
      img = 'https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353255/shout/jason-rosewell-ASKeuOZqhYU-unsplash_bszgzr.jpg'
      "<img src='#{img}' class='cover-image'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.cover_image.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='cover-image'>".html_safe
    end
  end

  def user_image(user)
    if user.photo.file.nil?
      img = 'https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg'
      "<img src='#{img}' class='user-image'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='user-image'>".html_safe
    end
  end

  def follow_picture(user)
    if user.photo.file.nil?
      img = 'https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg'
      "<img src='#{img}' class='follow-picture'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='follow-picture'>".html_safe
    end
  end

  def remove_yell(user, yell)
    return unless current_user == user

    link_to yell_path(yell.id), method: :delete do
      '<i class="fas fa-trash fa-lg"></i>'.html_safe
    end
  end
end
