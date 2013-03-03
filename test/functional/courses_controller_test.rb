require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
	assert_redirected_to new_user_session_path
  end
  
  test "should render the new page when logged in" do
	sign_in users(:jacob)
	get :new
	asset_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: @course.attributes
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: @course.attributes
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
