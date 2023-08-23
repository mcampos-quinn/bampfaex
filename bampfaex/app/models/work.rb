class Work < ApplicationRecord

  has_many :relations

  has_many :people, :through => :relations

  belongs_to :series
  belongs_to :event

end
