json.array! @notifications do |notification|
  json.recipient notification.recipient
  json.actor notification.actor.name
  json.action notification.action
  json.notifiable do #notification.notifiable
     json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
     end
  json.url order_path(notification.notifiable.order_code, anchor: dom_id(notification.notifiable))
end
