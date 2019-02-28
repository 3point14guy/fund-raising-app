module ProjectsHelper
  def days_left(deadline)
    diff = deadline.to_date.mjd - Date.today.mjd
    return diff
  end
end
