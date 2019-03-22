class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  include SessionsHelper

  private
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "users.please_log_in"
    redirect_to login_url
  end

  def admin_user
    return unless current_user.student?
    flash[:danger] = t "not_permission"
    redirect_to root_url
  end

  def list_permissions
    @permissions = Permission.by_role_id User.roles[current_user.role]
    @path_home =
      if current_user.student?
        user_path current_user
      else
        admin_user_path current_user
      end
  end
end
