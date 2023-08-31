class Person < ApplicationRecord

  has_many :relations

  belongs_to :event, optional: true
  belongs_to :work, optional: true
  belongs_to :series, optional: true

  validates_uniqueness_of :display_name, scope: [:name_note]

end
