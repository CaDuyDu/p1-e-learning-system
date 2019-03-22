class Admin::CoursesController < Admin::AdminBaseController
  before_action :load_subject, only: %i(edit show update destroy)
  before_action :logged_in_user, except: %i(show)

  def index
    @courses = Course.order_by.page(params[:page]).per Settings.user.record_page
  end

  def new
    @course = Course.new
    @subjects = Subject.all
    @list_subjects = {}
    @subjects.each do |subject|
      @list_subjects[subject.name_subject.to_s] = subject.id
    end
  end

  def create
    @course = Course.new courses_params
    if @course.save
      flash[:success] = t "create_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "update_failed"
      redirect_to new_admin_course_path
    end
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
