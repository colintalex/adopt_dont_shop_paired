class Pet < ApplicationRecord
  validates_presence_of :image_url, :name, :description, :approximate_age,
                        :sex
  validates :adoptable, inclusion: { in: [true, false] }
  belongs_to :shelter

  has_many :pet_adoption_apps
  has_many :adoption_apps, through: :pet_adoption_apps

  def make_unadoptable
    self.update(adoptable: false)
  end

  def make_adoptable
    self.update(adoptable: true)
  end

end
