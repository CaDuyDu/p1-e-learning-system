class Admin::SubjectsController < Admin::AdminBaseController
  before_action :load_subject, only: %i(edit show update destroy)
  before_action :logged_in_user, except: %i(show)

  def index
    @subjects = Subject.order_asc.page(params[:page]).per Settings.user.record_page
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "create_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "create_failed"
      redirect_to new_admin_course_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @subject.update subject_params
      flash[:success] = t ".subject_updated"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t ".update_failed"
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t ".subject_deleted"
    else
      flash[:danger] = t ".deleted_failed"
    end
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :name_subject, :description
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if (@subject)
    flash[:danger] = t "not_found"
    render :index
  end

end
