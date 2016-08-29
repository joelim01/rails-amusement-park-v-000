module UsersHelper

  def show_admin?(user)
    if user.admin?
     return  "ADMIN"
    end
  end

end
