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

class Course < ActiveRecord::Base
	has_many :enrolled_ins
	has_many :users, :through => :enrolled_ins
	has_many :events, :dependent => :destroy
	
	validates :name, presence: true
	validates :course_code, presence: true

	def self.search(search)
	  	if search
	    	find(:all, :conditions => ['course_code LIKE ?', "%#{search}%"])
	  	else
	    	find(:all)
	  	end
	end
end
