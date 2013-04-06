# == Schema Information
#
# Table name: enrolled_ins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EnrolledIn < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
end
