class Relation < ApplicationRecord

  belongs_to :series, optional: true
  belongs_to :event, optional: true
  belongs_to :work, optional: true
  belongs_to :people, optional: true

  validates_uniqueness_of :event_id, :allow_blank => true, :scope => [:series_id,:relation_value], if: -> { series_id.present? and relation_value.present?}
  validates_uniqueness_of :person_id, :allow_blank => true, :scope => [:series_id,:relation_value], if: -> { series_id.present? and relation_value.present?}
  validates_uniqueness_of :person_id, :allow_blank => true, :scope => [:event_id,:relation_value], if: -> { event_id.present? and relation_value.present?}
  validates_uniqueness_of :work_id, :allow_blank => true, :scope => [:event_id], if: -> { event_id.present? }
  validates_uniqueness_of :person_id, :allow_blank => true, :scope => [:work_id,:relation_value], if: -> { work_id.present? and relation_value.present?}

end
