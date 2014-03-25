class TimeSheet < ActiveRecord::Base
  belongs_to :user

  has_many :time_day, dependent: :destroy

  validates :user, :start_date, :end_date, presence: true

  validates_uniqueness_of :start_date, :scope => :user

  validate :start_is_monday

  def populate_week
    @monday = TimeDay.create({:time_day => self.start_date, :user => self.user, :time_sheet => self})
    @tuesday = TimeDay.create({:time_day => (self.start_date + 1.days), :user => self.user, :time_sheet => self})
    @wednesday = TimeDay.create({:time_day => (self.start_date + 2.days), :user => self.user, :time_sheet => self})
    @thursday = TimeDay.create({:time_day => (self.start_date + 3.days), :user => self.user, :time_sheet => self})
    @friday = TimeDay.create({:time_day => (self.start_date + 4.days), :user => self.user, :time_sheet => self})
    true
  end

  def start_is_monday
    if start_date.strftime("%A") != "Monday"
      errors.add(:start_date, "can't be a day other than Monday")
    end
  end
end
