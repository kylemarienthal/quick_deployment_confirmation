class Event < ActiveRecord::Base

  belongs_to :user, required: true

  has_many :messages

  has_many :attends
  has_many :attendees, through: :attends, source: :user
  before_save :downcase
  require 'date'
  validate :future_dated
  # validate_timeliness gem

  validates :name, :city, presence: true, length: { in: 2..30 }
  validates :state, presence: true, length: { is: 2 }
  def future_dated
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past.")
    end
  end

  def downcase
    self.name.downcase!
    self.city.downcase!
    self.state.downcase!
  end

end
