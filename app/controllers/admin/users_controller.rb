class Admin::UsersController < Admin::AdminBaseController
  before_action :load_user, except: %i(index)
  before_action :logged_in_user, except: %i(show)
  before_action :admin_user, except: %i(index)
  load_and_authorize_resource

  def index
    @users = User.order_asc.by_role(:student).page(params[:page]).per Settings.user.record_page
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".user_deleted"
    else
      flash[:danger] = t ".deleted_failed"
    end
    redirect_to admin_user_path current_user
  end

  private

  def user_params
    params.require(:user).permit :fullname, :birth, :gender, :address, :numberphone
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless ( !current_user.nil? && current_user.current_user?(@user) )
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "not_found"
    redirect_to login_path
  end
end
