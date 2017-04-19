include Rails.application.routes.url_helpers

class CaseMailer < ApplicationMailer
	default from: 'qt@querytracker.com'

	def logged_case(complaint)
		@complaint = complaint
		@user = complaint.user
		@admin = User.where("is_admin=?", true).first

		mail(to: [@user.email, @admin.email], subject: "Case #{complaint.id} logged")
	end

	def assigned_to()
	end

	def closed_case()
	end
end
