module EventsHelper
  def list_event_works(event_id: event_id,role: role)
    # query for related people and return an array of hashes
    work_relations = Relation.select("work_id").where(event_id: event_id, relation_value: role).all
    works = []
    work_relations.each do |w|
      puts w.work_id
      work = Work.find(w.work_id)
      works << work
    end
    return works
  end
end
