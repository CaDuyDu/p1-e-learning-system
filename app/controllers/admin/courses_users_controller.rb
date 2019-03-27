class Admin::CoursesUsersController < Admin::AdminBaseController
  before_action :list_permissions, only: %i(new edit show index)
  before_action :load_course_user, only: %i(update destroy)

  def update
    @course_user.activated!
    @course_user.debit = 0
    course = Course.find_by id: @course_user.course_id
    if @course_user.save
      permission = PermissionUser.new user_id: @course_user.user_id,
        name_permission: course.course_name,
        path: courses_user_path(course),
        icon: '<i class="fa fa-check-square-o" aria-hidden="true"></i>'

      permission.save
      flash[:success] = t "create_success"
      redirect_to admin_courses_users_path
    else
      flash[:danger] = t "create_failed"
      redirect_to admin_courses_users_path
    end
  end

  def index
    @list_wait = CourseUser.by_not_activated.page(params[:page]).per Settings.course_user.page
    @courses_users = Array.new
    @list_wait.each_with_index { |item, index|
      user = User.find_by id: item.user_id
      course = Course.find_by id: item.course_id
      subject = Subject.find_by id: course.subject_id
      @courses_users << { email: user.email, fullname_user: user.fullname,
        course_name: course.course_name, name_subject: subject.name_subject,
        created_at: item.created_at, debit: item.debit, course_user_id: item.id, course_user: item }
    }
  end

  def destroy
    if @course_user.destroy
      flash[:success] = t "delete_success"
      redirect_to admin_courses_users_path
    else
      flash[:danger] = t "delete_failed"
      redirect_to admin_courses_users_path
    end
  end


  private

  def load_course_user
    @course_user = CourseUser.find_by id: params[:id]
    return if (@course_user)
    flash[:danger] = t "not_found"
    redirect_to admin_courses_users_path
  end
end
