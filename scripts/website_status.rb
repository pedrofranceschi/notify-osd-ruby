#!/usr/bin/ruby

require "../lib/notify-osd-ruby.rb"

def website_is_online?(website)
	return true if system("ping -c 5 #{website}")
	return false
end

if ARGV.size != 1
	puts "usage: #{$0} <website_url>"
	exit
end

notification = Notification.new
notification.title = "Website Status Checker"

if website_is_online?(ARGV[0])
	notification.body = "Your website (#{ARGV[0]}) is online."
else
	notification.body = "Your website (#{ARGV[0]} is offline!"
	notification.urgency = "critical"
end

notification.post
