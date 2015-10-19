class Project < ActiveRecord::Base
	belongs_to :user
	has_many :backings
	has_many :reviews
	has_many :stages
	has_many :rewards
	belongs_to :stage


    before_validation :load_defaults
    
	def load_defaults
		if self.new_record?
			self.current_amount = 0
		end
	end
end
