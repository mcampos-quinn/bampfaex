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

  def get_resourcespace_image_previews(series_id)
    _series = Series.find(series_id)
    series_title = _series.series_title
    unless series_title.nil?
      # extend ResourcespaceHelper
      request = ResourcespaceHelper::RSpaceRequest.new
      response = request.search_get_previews(search_string="#{series_title}",resource_type=2)
      # puts response

    end

  end
end
