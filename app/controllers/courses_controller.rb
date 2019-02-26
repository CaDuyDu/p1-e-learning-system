class CoursesController < ApplicationController

  def index
    @courses = Course.desc.page(params[:page]).per Settings.courses.page
  end




end
