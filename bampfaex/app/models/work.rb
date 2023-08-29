class Work < ApplicationRecord

  has_many :relations

  has_many :people, :through => :relations

  belongs_to :series, optional: true
  belongs_to :event, optional: true

end
