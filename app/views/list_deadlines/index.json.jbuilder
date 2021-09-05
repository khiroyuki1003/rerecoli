json.array! @events do |event|
  json.id event.id
  json.title event.list.list_title
  json.start event.list_deadline_date
  json.url profile_category_list_path(event.profile.id, event.list.category.id, event.list.id)
  json.color '#00947a'
end

json.array! @reminds do |remind|
  json.id remind.id
  json.title remind.list_remind_title
  json.start remind.list_remind_date
  json.url profile_category_list_list_remind_path(remind.profile.id, remind.list.id, remind.list.id, remind.id)
  json.color '#2cb4ad'
end