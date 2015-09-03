class Account < ActiveRecord::Base
	def details
		{name: self.name, description: self.description, welcome_msg: self.welcome_msg}
	end
end
