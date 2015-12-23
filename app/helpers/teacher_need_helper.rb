module TeacherNeedHelper

  # Convert from a default rails date, which comes as UTC and has an unfriendly format
  # to a local date that is formatted month/day/year.
  def show_date(default_rails_date)
    default_rails_date.in_time_zone("Pacific Time (US & Canada)").strftime('%m/%d/%Y')
  end
end
