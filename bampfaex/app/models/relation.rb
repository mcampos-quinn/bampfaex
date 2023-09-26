class Relation < ApplicationRecord

  belongs_to :series, optional: true
  belongs_to :event, optional: true
  belongs_to :work, optional: true
  belongs_to :people, optional: true

  validates_uniqueness_of :series_id, :scope => [:event_id,:relation_value], :allow_nil => true
  validates_uniqueness_of :series_id, :scope => [:person_id,:relation_value], :allow_nil => true
  validates_uniqueness_of :event_id, :scope => [:person_id], :allow_nil => true
  validates_uniqueness_of :event_id, :scope => [:work_id], :allow_nil => true
  validates_uniqueness_of :work_id, :scope => [:person_id], :allow_nil => true

end
