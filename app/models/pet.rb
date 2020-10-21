class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_apps, dependent: :destroy
  has_many :apps, through: :pet_apps, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :image
  validates_presence_of :age
  validates_presence_of :sex
  validates_presence_of :description
  validates_presence_of :shelter_id
  validates_presence_of :status

  def find_petapp(app_id)
    PetApp.find_by(pet_id: self.id, app_id: app_id)
  end

  def already_approved?
    apps.map{|app| app.status}.any?("Approved")
  end

  def app_approved?
    apps.map do |app|
      app.status
    end.any?("Approved")
  end
end
