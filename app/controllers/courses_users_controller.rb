class CoursesUsersController < ApplicationController
  before_action :list_permissions, only: %i(new edit show index)

  def create
    @course_user = CourseUser.new
    @course_user.course_id = params[:format]
    @course_user.user_id = current_user.id
    course = Course.find_by id: params[:format]
    @course_user.debit = course.price
    if @course_user.save
      course.quantity_registered = course.quantity_registered + 1
      course.save
      flash[:success] = t "register_success"
    else
      flash[:danger] = t "register_failed"
    end
    redirect_to courses_path
  end

  def show
    user_course = CourseUser.find_by(user_id: current_user.id, course_id: params[:id])
    if user_course.activated?
      @lessons = Lesson.by_course_id(params[:id]).page(params[:page]).per Settings.course_user.page
    else
      redirect_to courses_path
      flash[:danger] = t ".not_yet_confirmed"
    end
  end
end
