class PetApp < ApplicationRecord
  belongs_to :pets
  belongs_to :applications
end
