module ApplicationHelper
  def is_admin?
    @current_user.present? && @current_user.is_admin?
  end

  def intellinav
    links = ''
    if @current_user.present?
      if @current_user.is_admin
        links << "<li>#{link_to('Show Users', users_path)}</li>"
      end
      links << "<li>#{link_to('Edit User Details', edit_users_path)}</li>"
      links << "<li>"
      links << "#{link_to('Logout '+ @current_user.name, login_path, :method => :delete, :confirm => 'Really?')}"
      links << "</li>"
    else
      links << "<li>#{link_to('Create Account', new_user_path)}</li>"
      links << "<li>#{link_to('Login', login_path)}</li>"
    end
    links
  end
end
