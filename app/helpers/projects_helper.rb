module ProjectsHelper
  def days_left(deadline)
    diff = deadline.to_date.mjd - Date.today.mjd
    return diff
  end

  def goal_reached(project)
    if project.funding >= project.goal
      return true
    end
  end

end
