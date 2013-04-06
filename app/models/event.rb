# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  due_date    :date
#  worth       :float
#  achieved    :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

class Event < ActiveRecord::Base
	belongs_to :course
end
