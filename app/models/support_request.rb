class SupportRequest < ActiveRecord::Base

  DEPT_SALES     = "Sales"
  DEPT_MARKETING = "Marketing"
  DEPT_TECHNICAL = "Technical"

  DEPARTMENTS    = [DEPT_SALES, DEPT_MARKETING, DEPT_TECHNICAL]

  after_initialize :set_defaults

  validates :name, presence: true
  validates :email, presence: true

  def self.search(term)
    wildcard_term = "%#{term}%"
    where("name ILIKE :term OR email ILIKE :term OR department ILIKE :term OR message ILIKE :term", {term: wildcard_term})
  end

  private

  def set_defaults
    self.done ||= false
    self.department ||= DEPT_SALES
  end

end
