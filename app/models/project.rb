class Project < ApplicationRecord
  belongs_to :user

  def self.current
    where("deadline >= ?", Date.today).order("deadline asc")
  end

end
