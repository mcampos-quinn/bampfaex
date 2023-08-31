class Series < ApplicationRecord
  has_many :events, :through => :relations
  has_many :works, :through => :relations
  has_many :persons, :through => :relations

  def start_date_display
    begin
      @start_date_display = self.series_start_date&.strftime('%B %d, %Y')
    ensure
      @start_date_display= ""
    end
  end

  def end_date_display
    begin
      @end_date_display = self.series_end_date&.strftime('%B %d, %Y')
    ensure
      @end_date_display= ""
    end
  end

end
