class TimeDay < ActiveRecord::Base
  belongs_to :time_sheet
  belongs_to :user

  has_many :time_item, dependent: :destroy

  validates :user, :time_sheet, :time_day, presence: true
end
