class TimeItem < ActiveRecord::Base
  belongs_to :timeday
  belongs_to :user

  validates :user, :time_day, :time_lodged, :category, presence: true
end
