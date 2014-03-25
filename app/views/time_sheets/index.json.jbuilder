json.array!(@time_sheets) do |time_sheet|
  json.extract! time_sheet, :id, :user_id, :start_date, :end_date
  json.url time_sheet_url(time_sheet, format: :json)
end
