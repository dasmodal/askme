module UsersHelper
  def display_user(user)
    "@#{user.nickname}"
  end
end
