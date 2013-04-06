# == Schema Information
#
# Table name: courses
#
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  school      :string(255)
#  course_code :string(255)
#  id          :integer          not null, primary key
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
