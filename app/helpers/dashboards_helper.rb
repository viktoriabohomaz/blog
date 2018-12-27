module DashboardsHelper
	def admin?
		current_user.role == 'admin'
	end
end
