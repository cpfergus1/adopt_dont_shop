class Application <  ApplicationRecord
  has_many :pet_apps
  has_many :pets, through: :pet_apps
  belongs_to :user
  validates_presence_of :description
  validates_presence_of :status
end
