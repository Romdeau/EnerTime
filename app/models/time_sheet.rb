class TimeSheet < ActiveRecord::Base
  belongs_to :user

  has_many :time_day, dependent: :destroy

  validates :user, :start_date, :end_date, presence: true
end
