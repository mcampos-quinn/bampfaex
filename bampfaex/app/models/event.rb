class Event < ApplicationRecord

  has_many :relations

  has_many :people, :through => relation
  has_many :works, :through => relation

  belongs_to :series

end
