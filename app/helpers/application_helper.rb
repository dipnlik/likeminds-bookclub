module ApplicationHelper
  def login_header
    return '' if session[:user_id].nil?
    
    user = User.find(session[:user_id])
    username_link = link_to(user.username, user)
    logout_link = link_to('not you?', logout_path)
    
    content_tag 'small' do
      raw "(welcome, #{username_link}. #{logout_link})"
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
