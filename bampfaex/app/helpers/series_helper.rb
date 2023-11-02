module SeriesHelper
  def list_series_people(series_id: @series_id,role: @role)
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

  def list_series_relations(series_id: nil, target_model: nil, role: nil)
    # query for related people and return an array of hashes
    _id = target_model.to_s+"_id"
    target_id_label = _id.downcase
    model_name = target_model.constantize
    _relations = Relation.select(target_id_label).where(series_id: series_id, relation_value: role).all
    unless _relations.to_a == []
      relateds = []
      _relations.each do |r|
        target_id = r.as_json[target_id_label]
        related = model_name.find(target_id)
        relateds << related
      end
      puts relateds
    end
    return relateds
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
