class Admin::LessonsController < Admin::AdminBaseController
  before_action :list_permissions, only: %i(new edit show index)
  before_action :load_lessons, only: %i(edit show update destroy)

  def index
    @lessons = Lesson.order_by.page(params[:page]).per Settings.user.record_page
    @search = Lesson.search(params[:q])
    @lessons_q = @search.result(distinct: true)
  end

  def new
    @lessons = Lesson.new
    @courses = Course.all
    @list_courses = {}
    @courses.each do |course|
      @list_courses[course.course_name.to_s] = course.id
    end
  end

  def create
    @lessons = Lesson.new lessons_params
    if @lessons.save
      flash[:success] = t "create_success"
      redirect_to  admin_lessons_path
    else
      flash[:danger] = t "update_failed"
      redirect_to new_admin_lesson_path
    end
  end

  def show
    select_option_courses
  end

  def edit
    select_option_courses
  end

  def update
    if @lessons.update lessons_params
      flash[:success] = t "updated_success"
      redirect_to admin_lessons_path
    else
      flash[:danger] = t "update_failed"
      render :edit
    end
  end

  def destroy
    if @lessons.destroy
      flash[:success] = t "deleted_success"
    else
      flash[:danger] = t "deleted_failed"
    end
    redirect_to admin_lessons_path
  end

  def search
    index
    render :index
  end

  private

  def lessons_params
    params.require(:lesson).permit :course_id, :title, :content
  end

  def load_lessons
    @lessons = Lesson.find_by id: params[:id]
    return if (@lessons)
    flash[:danger] = t "not_found"
    render :index
  end

  def select_option_courses
    @courses = Course.all
    @list_courses = {}
    @courses.each do |courses|
      @list_courses[courses.course_name.to_s] = courses.id
    end
  end
end
