class App <  ApplicationRecord
  has_many :pet_apps
  has_many :pets, through: :pet_apps
  belongs_to :user
  validates_presence_of :status

  def app_approved
    find_petapp.map{|pet| pet.status == "Approved"}
  end

  def find_petapp
    PetApp.where(app_id: self.id)
  end

end
