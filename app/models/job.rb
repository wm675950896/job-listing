class Job < ApplicationRecord
  belongs_to :user
  has_many :resumes
  validates :title, :presence => true
  validates :wage_lower_bound, :presence => true
  validates :wage_upper_bound, :presence => true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  scope :appear, -> {
      where(:exist => "Y")
  }
end
