module ApplicationHelper
  def get_flash_bootstrap_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-danger"
    end
  end

  def get_current_user
    @current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def is_logined?
    !get_current_user.nil?
  end

  def authenticate_user
    redirect_to login_url unless is_logined?
  end
end


