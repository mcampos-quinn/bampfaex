class Relation < ApplicationRecord

  belongs_to :series, optional: true
  belongs_to :event, optional: true
  belongs_to :work, optional: true
  belongs_to :people, optional: true

end
