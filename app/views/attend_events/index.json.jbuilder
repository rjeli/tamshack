json.array!(@attend_events) do |attend_event|
  json.extract! attend_event, :id
  json.url attend_event_url(attend_event, format: :json)
end
