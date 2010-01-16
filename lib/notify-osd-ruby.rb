#!/usr/bin/ruby

# notify-osd-ruby.rb
# sends ubuntu's notify-osd notifications
# by pH (Pedro Henrique Cavallieri Franceschi) - iBlogeek.com - 2006-2010 (C) - All Rights Reserved - @pedroh96 - pedrohfranceschi@gmail.com

class Notification

	attr_writer :title, :body, :urgency, :expire_time, :icon

	def user_is_using_ubuntu_and_have_notify_osd_installed?
		if (%x[uname -a].downcase)["ubuntu"]
			return true
		else
			return false
		end
	end

	def initialize
		# detects if the user is using ubuntu and have notify-osd installed.
		unless user_is_using_ubuntu_and_have_notify_osd_installed?
			raise "Notify-OSD notifications is not installed or you aren't using Ubuntu."
		end
	end

	def post
		if @title == nil or @body == nil or @title == "" or @body == ""
			raise "Notification title and/or body can't be nil!"
		end
		if @urgency == nil then @urgency = "normal" end
		if @expire_time == nil then	@expire_time = "500" end
		icon_arg = String.new
		if @icon == nil then @icon = "" end
		notification = system("notify-send --urgency=#{@urgency} --expire-time=#{@expire_time} --icon=#{@icon} \"#{@title}\" \"#{@body}\"")
		unless notification
			raise "An error occurred posting your notification"
		end
	end

end

