module SimpleCalendar
  module CalendarHelper
    def select_calendar_years
      calendar_years = []
      Event.find_each {|e| calendar_years <<  e.date&.strftime("%Y - %M")}
      calendar_years = calendar_years.compact().uniq!.sort!
      return calendar_years
    end
  end
end
