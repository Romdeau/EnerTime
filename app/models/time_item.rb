class TimeItem < ActiveRecord::Base
  belongs_to :timeday
  belongs_to :user
end
