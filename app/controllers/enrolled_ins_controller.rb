class EnrolledInsController < ApplicationController

  def new

  end

  def add
  	@course = Course.find(params[:course])
  	@user = current_user
    t = 0
    notice = ''

    @user.courses.each do |ucourse|
      if ucourse == @course
        t = 1
        break
      end
    end

    if t == 0
    	@enrolled_in = EnrolledIn.new()
    	@enrolled_in.user_id = @user.id
    	@enrolled_in.course_id = @course.id
    	@course.enrolled_ins << @enrolled_in
    	@user.enrolled_ins << @enrolled_in
    	if @enrolled_in.save
        track_activity @course
        notice = 'Successfully added course.'
      else
        notice = 'Adding the event failed, please try again.'
      end
    else   
      notice = 'You are already enrolled in that course.'
    end

  	respond_to do |format|
  		format.html { redirect_to courses_path, notice: notice}
  		format.json
	  end
  end

  def remove
    course = Course.find(params[:course])
    user = current_user

    if user
      user.events.each do |event|
        if event.course == course
          user.events.delete(event)
        end
      end
      user.courses.delete(course)
      redirect_to courses_path, notice: 'Course Removed.'
    end
  end

end
