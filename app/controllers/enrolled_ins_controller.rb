class EnrolledInsController < ApplicationController
  def new
  	@course = Course.find(params[:course])
  	@user = current_user
  	@enrolled_in = EnrolledIn.new()
  	@enrolled_in.user_id = @user.id
  	@enrolled_in.course_id = @course.id
  	@course.enrolled_ins << @enrolled_in
  	@user.enrolled_ins << @enrolled_in
  	@enrolled_in.save

  	respond_to do |format|
  		format.html { redirect_to courses_path, notice: 'Successfully added course.'}
  		format.json
	end
  end

  def create
  	@course = Course.find(params[:course])
  	@user = current_user
  	@enrolled_in = EnrolledIn.new()
  	@enrolled_in.user_id = @user.id
  	@enrolled_in.course_id = @course.id
  	@course.enrolled_ins = @enrolled_in
  	@user.enrolled_ins = @enrolled_in
  	@enrolled_in.save

  	respond_to do |format|
  		format.html { redirect_to courses_path}
  		format.json
	end
  end

  def remove
    course = Course.find(params[:course])
    user = @event.users.find(current_user)

    if user
      course.users.delete(user)
      redirect_to courses_path, notice: 'Event Removed.'
    end
  end
end
