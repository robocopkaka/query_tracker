include Rails.application.routes.url_helpers

class CaseMailer < ApplicationMailer
	default from: 'qt@querytracker.com'

	def logged_case(complaint)
		@complaint = complaint
		@resolution_note = @complaint.resolution_note
		@user_email = complaint.user.email
		@admin = User.where("is_admin=?", true).first

		mail(to: [@user_email, @admin.email], subject: "Case #{complaint.id} logged")
	end

	def assigned_to()
	end

	def closed_case(complaint)
		@complaint = complaint
		@user = complaint.user
		@admin = User.where("is_admin=?", true).first

		mail(to: [@user_email, @admin.email], subject: "Case #{complaint.id} closed")
	end

	def resolved(complaint)
		@complaint = complaint
		@user = complaint.user

		mail(to: [@user_email], subject: "Case #{complaint.id} was just fixed")
	end

	def reopen(complaint)
		@complaint = complaint
		@resolution_note = @complaint.resolution_note
		@user_email = complaint.user.email
		@admin = User.where("is_admin=?", true).first

		mail(to: [@user_email, @admin.email], subject: "Case #{complaint.id} was re-opened")
	end
end
