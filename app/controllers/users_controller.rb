class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def show
    @activities = Activity.order("created_at desc")

    @events = current_user.events.all

    @courses = current_user.courses.all

    

    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
end
