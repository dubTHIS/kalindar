require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
	test "a user should enter a first name" do 
		user = User.new
		assert !user.save
		assert !user.error[:first_name].empty?
	end
  
	test "a user should enter a last name" do 
		user = User.new
		assert !user.save
		assert !user.error[:last_name].empty?
	end
	
	test "a user should enter a profile name" do 
		user = User.new
		assert !user.save
		assert !user.error[:profile_name].empty?
	end
end
