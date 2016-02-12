class SupportRequest < ActiveRecord::Base

  DEPT_SALES     = "Sales"
  DEPT_MARKETING = "Marketing"
  DEPT_TECHNICAL = "Technical"

  after_initialize :set_defaults

  validates :name, presence: true
  validates :email, presence: true

  private

  def set_defaults
    self.done ||= false
    self.department ||= DEPT_SALES
  end

end
