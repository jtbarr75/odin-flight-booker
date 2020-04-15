class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def self.start_times
    pluck(:start_time).map {|a| [a.strftime("%d/%m/%Y"), a.to_date]}.uniq
  end

  scope :filter_by_from, -> (from_id) { where(from_airport_id: from_id) }
  scope :filter_by_to, -> (to_id) { where(to_airport_id: to_id) }
  scope :filter_by_start_time, -> (start_time) do
     where('start_time BETWEEN ? AND ?', 
            start_time.to_date.beginning_of_day, 
            start_time.to_date.end_of_day) 
  end

  def info
    "#{from_airport.code} -> #{to_airport.code} 
    Departs: #{start_time} Duration: #{duration} minutes"
  end
end
