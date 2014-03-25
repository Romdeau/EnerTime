json.array!(@time_days) do |time_day|
  json.extract! time_day, :id, :time_day, :time_sheet_id, :user_id
  json.url time_day_url(time_day, format: :json)
end
