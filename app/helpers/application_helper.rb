module ApplicationHelper
	def notice_message
		# 程式內容可參考
		# http://kakas-blog.logdown.com/posts/286448-rails101-chapter3-notice-message
	  alert_types = { notice: :success, alert: :danger }

	  close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
	  close_button = content_tag(:button, "×", close_button_options)

	  alerts = flash.map do |type, message|
	    alert_content = close_button + message

	    # alert_types = { notice: :success, alert: :danger } => { :notice => :success, :alert => :danger }
	    # "notice".to_sym  => :notice
	    alert_type = alert_types[type.to_sym] || type
	    alert_class = "alert alert-#{alert_type} alert-dismissable"

	    content_tag(:div, alert_content, class: alert_class)
	  end

	  alerts.join("\n").html_safe
	end
end
