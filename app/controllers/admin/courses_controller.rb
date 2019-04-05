class Admin::CoursesController < Admin::AdminBaseController
  include Admin::SubjectsHelper
  before_action :load_course, only: %i(edit show update destroy)
  before_action :admin_user
  before_action :select_option_subjects, only: %i(new edit)

  def index
    @courses = Course.order_by.page(params[:page]).per Settings.user.record_page
  end

  def new
    @course = Course.new
  end

  def create
    courses_params[:price].gsub!(".","")
    @course = Course.new courses_params
    @course.user_id = current_user.id
    if @course.save
      flash[:success] = t "create_success"
      redirect_to admin_courses_path
    else
      flash[:danger] = t "create_failed"
      redirect_to new_admin_course_path(@course)
    end
  end

  def show
  end

  def edit
  end

  def update
    courses_params[:price].gsub!(".","")
    if @course.update courses_params
      flash[:success] = t "updated_success"
      redirect_to admin_courses_path
    else
      flash[:danger] = t "update_failed"
      list_permissions
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = t "deleted_success"
    else
      flash[:danger] = t "deleted_failed"
    end
    redirect_to admin_courses_path
  end

  private

  def courses_params
    params.require(:course).permit :subject_id, :course_name,
      :quantity_registered, :price, :description, :start_time
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if (@course)
    flash[:danger] = t "not_found"
    render :index
  end
end
