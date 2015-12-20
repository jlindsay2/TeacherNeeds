class TeacherNeed < ActiveRecord::Base
  belongs_to :teacher
  before_save :default_values

  def default_values
    self.status ||= 'Active' # Set self.status to "Active" if there is no status yet.
  end
end
