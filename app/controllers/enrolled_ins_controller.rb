class EnrolledInsController < ApplicationController
  def new
  	@course = Course.find(params[:course])
  	@user = current_user
  	@enrolled_in = EnrolledIn.new()
  	@enrolled_in.user_id = @user.id
  	@enrolled_in.course_id = @course.id

  	respond_to do |format|
  		format.html { redirect_to courses_path, notice: 'Successfully added course.'}
  		format.json
	end
  end

  def create
  	@course = Course.find(params[:course])
  	@user = current_user
  	@enrolled_in = EnrolledIn.build()
  	@enrolled_in.user_id = @user.id
  	@enrolled_in.course_id = @course.id

  	respond_to do |format|
  		format.html { redirect_to courses_path}
  		format.json
	end
  end

  def destroy
  	@enrolled_in = EnrolledIn.find(params[:id])
    @enrolled_in.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
