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

  def profile_picture(user)
    if user.photo.file.nil?
      img = "https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg"
      "<img src='#{img}' class='profile-picture'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='profile-picture'>".html_safe
    end
  end

  def user_photo(user)
    if user.photo.file.nil?
      img = "https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg"
      "<img src='#{img}' class='yell-picture'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='yell-picture'>".html_safe
    end
  end

  def yell_author_photo(yell)
    if yell.author.photo.file.nil?
      img = "https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353261/shout/colton-sturgeon-odKeTFsBDgE-unsplash_aoxjzy.jpg"
      "<img src='#{img}' class='yell-picture'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='yell-picture'>".html_safe
    end
  end

  def cover_image(user)
    if user.cover_image.file.nil?
      img = "https://res.cloudinary.com/hupxp3pqa/image/upload/v1623353255/shout/jason-rosewell-ASKeuOZqhYU-unsplash_bszgzr.jpg"
      "<img src='#{img}' class='cover-image'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.cover_image.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='cover-image'>".html_safe
    end
  end

  def upload_photo(user)
    res = ''

    if current_user == user
      upload_picture = link_to "" do
        '<div class="mx-2 my-2 upload-picture-button"><i class="fas fa-portrait fa-lg"></i></div>'.html_safe
      end
      res << upload_picture
    end
    res.html_safe
  end

  def upload_cover(user)
    res = ''

    if current_user == user
      res << "<%= form_for(modle :user, method: put, multipart: true) do |f| %>"
      res << "<% f.label :cover_image %>"
      res << "<% f.hidden_field :cover_image_cache %>"
      res << "<% f.file_field :cover_image, { onchange: 'this.form.submit();' } %>"
      res << "<% end %>"
      # '<div class="mx-2 my-2 upload-cover-button"><i class="fas fa-tv fa-lg"></i></div>'.html_safe
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
