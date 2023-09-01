require 'date'

class Event < ApplicationRecord

  has_many :relations

  has_many :people, :through => relation
  has_many :works, :through => relation

  belongs_to :series, optional: true

  validates_uniqueness_of :date, scope: [:datetime_one, :screening_title]

  def display_date
    begin
      @display_date = self.date&.strftime('%B %d, %Y')
    ensure
      @display_date= ""
    end
  end

  def showtime_one_display
    begin
      @showtime_one_display = self.datetime_one&.strftime('%l:%M %p')
    ensure
      @showtime_one_display= ""
    end
  end

  def showtime_two_display
    begin
      @display_date = self.datetime_two&.strftime('%l:%M %p')
    ensure
      @display_date= ""
    end
  end

end
