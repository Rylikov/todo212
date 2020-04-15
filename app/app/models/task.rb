class Task < ApplicationRecord
  belongs_to :user
  validates :summary, presence: true
  validates :status,  presence: true
  validates :user_id, presence: true, numericality: true

  def done?
    self.status == "done"
  end
end
