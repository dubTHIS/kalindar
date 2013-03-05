class Course < ActiveRecord::Base
	has_many :enrolled_ins
	has_many :users, :through => :enrolled_ins
	has_many :events, :dependent => :destroy
	
	validates :name, presence: true
	validates :course_code, presence: true
end
