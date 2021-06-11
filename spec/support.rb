def log_in(user)
  visit login_path
  fill_in 'username', with: user.username

  click_button 'Login'
end