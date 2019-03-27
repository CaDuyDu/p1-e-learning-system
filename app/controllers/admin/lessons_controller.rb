class Admin::LessonsController < Admin::AdminBaseController
  before_action :list_permissions, only: %i(new edit show index)
  before_action :load_subject, only: %i(edit show update destroy)

  def index
    @lessons = Lesson.order_by.page(params[:page]).per Settings.user.record_page
  end

  def new
    @lessons = Lesson.new
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

  private

  def lessons_params
    params.require(:lesson).permit :course_id, :video_id, :title, :content
  end
end
