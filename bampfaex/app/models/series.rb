class Series < ApplicationRecord
  has_many :events, :through => :relations
  has_many :works, :through => :relations
  has_many :persons, :through => :relations
end
