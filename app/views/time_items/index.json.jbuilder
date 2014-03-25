json.array!(@time_items) do |time_item|
  json.extract! time_item, :id, :timeday_id, :user_id, :time, :description, :category, :cost_centre
  json.url time_item_url(time_item, format: :json)
end
