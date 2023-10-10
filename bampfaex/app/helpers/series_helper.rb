module SeriesHelper
  def list_series_people(series_id: series_id,role: role)
    # query for related people and return an array of hashes
    people_relations = Relation.select("person_id").where(series_id: series_id, relation_value: role).all
    people = []
    people_relations.each do |p|
      begin
        person = Person.find(p.person_id)
        people << person
      rescue ActiveRecord::RecordNotFound
        puts "#{people}not found"
      end
    end
    return people
  end
end
