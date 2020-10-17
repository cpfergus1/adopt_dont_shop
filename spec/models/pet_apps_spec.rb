require 'rails_helper'

RSpec.describe PetApp, type: :model do
  it do
    should belong_to :app
    should belong_to :pet
  end
end
