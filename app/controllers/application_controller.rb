class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery with: :exception
  before_action :set_locale
  helper_method :check_admin, :check_student
  before_action :authenticate_user!

  include SessionsHelper

  def check_admin
    !current_user.student?
  end

  def check_student
    current_user.student?
  end

  protected
  def after_sign_up_path_for(resource)
    return new_user_session_path
  end

  def after_sign_in_path_for(resource)
    if resource.student?
      courses_path
    else resource.admin?
      admin_courses_path
    end
  end

  private
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def layout_by_resource
    if devise_controller?
      new_user_session_path
    end
  end

  def admin_user
    return unless current_user.student?
    flash[:danger] = t "not_permission"
    redirect_to root_url
  end

  def list_permissions
    @permissions = Permission.by_role_id User.roles[current_user.role] || []
    @path_home =
      if current_user.student?
        list_permissions_user
        user_path current_user
      else
        admin_user_path current_user
      end
  end

  def list_permissions_user
    @permissions_user = PermissionUser.by_user_id current_user.id
    @path_home = courses_path
  end
end
