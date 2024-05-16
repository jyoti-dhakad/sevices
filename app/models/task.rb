class Task < ApplicationRecord
  before_save :set_default_completed_value

  validates :title, presence: true

  private

  def set_default_completed_value
    self.completed ||= false
  end
end
