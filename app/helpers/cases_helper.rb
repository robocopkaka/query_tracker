module CasesHelper
	def notifications_and_mailer(user)
		current_user = user
		@case = current_user.cases.new(case_params)
    	@admin = User.where("is_admin=?",true).first
    	@assigned = User.find(@case.assigned_to)
		if @case.open?
			CaseMailer.reopen(@case).deliver_now
			[@assigned, @admin].each do |user|
				Notification.create(actor: current_user, recipient: user, action: "Reopened", notifiable: @case)
			end
		elsif @case.fixed?
			CaseMailer.resolved(@case).deliver_now
			[@case.user, @admin].each do |user|
				Notification.create(actor: current_user, recipient: user, action: "Resolved", notifiable: @case)
			end
		end
	end
end
