module WorksHelper
  def list_work_people(work_id: work_id,role: role)
    # query for related people and return an array of hashes
    people_relations = Relation.select("person_id").where(work_id: work_id, relation_value: role).all
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
  def list_work_events(work_id: work_id,role: role)
    # query for related events and return an array of hashes
    events_relations = Relation.select("event_id").where(work_id: work_id, relation_value: role).all
    events = []
    events_relations.each do |p|
      begin
        event = Event.find(p.event_id)
        events << event
      rescue ActiveRecord::RecordNotFound
        puts "#{events}not found"
      end
    end
    return events
  end
end
