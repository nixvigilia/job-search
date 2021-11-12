#https://github.com/excid3/simple_discussion#simple_discussion_slack_url
SimpleDiscussion.setup do |config|
    config.send_email_notifications = true # Default: true
    config.send_slack_notifications = false # Default: true
end