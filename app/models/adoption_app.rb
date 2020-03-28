class AdoptionApp < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :phone_number,
                        :description

  has_many :pet_adoption_apps
  has_many :pets, through: :pet_adoption_apps

  def process(pet_ids)
    pet_ids.each do |id|
      PetAdoptionApp.create(adoption_app:self, pet_id:id)
    end
  end
end
