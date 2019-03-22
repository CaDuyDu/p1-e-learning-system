class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
    @courses = Course.order_by.page(params[:page]).per Settings.courses.page
  end
end
