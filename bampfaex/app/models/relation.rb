class Relation < ApplicationRecord

  belongs_to :series
  belongs_to :event
  belongs_to :work
  belongs_to :people

end
