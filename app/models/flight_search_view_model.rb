class FlightSearchViewModel
  include ActiveModel::Model

  attr_accessor :date, :tail_number, :time

  validates :date, presence: true
  validates :tail_number, presence: true
  validates :time, presence: true
end