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

require 'test_helper'

class EnrolledInTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
