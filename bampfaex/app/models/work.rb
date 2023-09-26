class Work < ApplicationRecord

  has_many :relations

  has_many :people, :through => :relations

  belongs_to :series, optional: true
  belongs_to :event, optional: true

  validates_uniqueness_of :title, scope: [:wikidata_id]

  def make_unique_combo
    _title = (self.title || "")
    _year = (self.year || "")
    _wikidata_id = (self.wikidata_id||"")
    @unique_combo = "#{self.title}#{self.year}#{self.wikidata_id}"

    _title << _year << _wikidata_id
  end

end
