json.array!(@topics) do |topic|
  json.extract! topic, :id, :title, :comment
  json.url topic_url(topic, format: :json)
end
