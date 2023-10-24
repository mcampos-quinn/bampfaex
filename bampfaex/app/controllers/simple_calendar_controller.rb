class SimpleCalendarController < ApplicationController
  def index
    @events = Event.all.order(:date)
    start_date = params.fetch(:start_date, Date.today).to_date
    @calendar_events = Event.where(datetime_one: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).or(Event.where(datetime_two: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)).order(:datetime_one)
  end
end
