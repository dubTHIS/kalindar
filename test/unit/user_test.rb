# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  profile_name           :string(255)
#  school                 :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
