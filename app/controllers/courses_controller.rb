class CoursesController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update]

  # GET /courses
  # GET /courses.json 
  def index
    @courses = Course.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/search
  def search
    @courses = Course.search(params[:search])
    respond_to do |format|
      if @courses.empty?
        format.html { redirect_to new_course_path, notice: 'No courses found with that course code, please create it.'}
        format.json
      else
        format.html # search.html.erb
        format.json { render json: @courses }
      end
    end
  end

  def search_event
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # search_event.html.erb
      format.json { render json: @course }
    end
  end

  def create_event
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # create_event.html.erb
      format.json { render json: @course }
    end
  end
  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to new_enrolled_in_path(:course => @course.id), notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
