json.array! @notifications do |notification|
	json.actor notification.actor.name
	json.action notification.action
	json.notifiable do
		json.type "a #{notification.notifiable.class.to_s.humanize.downcase}"
	end
	json.url case_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end