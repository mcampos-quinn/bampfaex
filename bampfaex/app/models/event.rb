require 'date'

class Event < ApplicationRecord

  has_many :relations

  has_many :people, :through => relation
  has_many :works, :through => relation

  belongs_to :series, optional: true

  def display_date
    begin
      @display_date = Date.strptime(self.date,"%F")
    ensure
      @display_date= ""
    end
  end

end
