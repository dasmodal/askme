module UsersHelper
  def display_user(user)
    "@#{user.nickname}"
  end

  def header_color(user)
    user.header_color == 'dark-sienna' ? 'button-orange-web' : 'button-dark-sienna'
  end
end
