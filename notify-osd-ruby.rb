#!/usr/bin/ruby

class Notification

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

end
