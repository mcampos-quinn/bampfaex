class Event < ApplicationRecord

  has_many :relations
  
  has_many :people, :through => relations
  has_many :works, :through => relations

  belongs_to :series

end
