class Person < ApplicationRecord

  has_many :relations

  belongs_to :event
  belongs_to :work
  belongs_to :series

end
