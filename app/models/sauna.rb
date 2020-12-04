class Sauna < ApplicationRecord
  belongs_to :admin
  has_one_attached :image
  has_many :plans, dependent: :destroy

  validates :name,           presence: true
  validates :sauna_deg,      presence: true
  validates :water_deg,      presence: true
  validates :price,          presence: true
  validates :time_limit,     presence: true
  validates :address,        presence: true
  validates :business_hours, presence: true
  validates :image,          presence: true
end
