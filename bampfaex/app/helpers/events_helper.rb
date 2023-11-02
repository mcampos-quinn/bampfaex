module EventsHelper
  def list_event_relations(event_id: nil, target_model: nil, role: nil)
    # query for related people and return an array of hashes
    _id = target_model.to_s+"_id"
    target_id_label = _id.downcase
    model_name = target_model.constantize
    _relations = Relation.select(target_id_label).where(event_id: event_id, relation_value: role).all
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

  def list_internet_archive_recordings(event_id: @event_id)
    require 'net/http'
    _event = Event.find(event_id)
    date = _event.date
    # screening_title = _event.screening_title
    unless date.nil?
      ia_query = "https://archive.org/advancedsearch.php?q=(date:[#{date}])+AND+collection%3A(pacificfilmarchive)&fl[]=identifier&rows=5&page=1&output=json#raw"
      # this alternative query adds the screening title, but that's so often blank...
      # ia_query = "https://archive.org/advancedsearch.php?q=(date:[#{date}])+AND+collection%3A(pacificfilmarchive)+AND+text%3A(%22#{screening_title}%22)&rows=5&page=1&output=json#raw"
      url = URI.parse(ia_query)
      puts url
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port,use_ssl: true) {|http| http.request(req) }
      hash_response = JSON.parse(res.body)
      ia_response = hash_response['response']
      docs = ia_response['docs']
      puts docs
      embed_links = []
      docs.each do |d|
        embed_links << "<li class='list-group-item'><iframe src='https://archive.org/embed/#{d['identifier']}' width='500' height='60' frameborder='0' webkitallowfullscreen='true' mozallowfullscreen='true' allowfullscreen></iframe></li>"
      end
      return embed_links
    end
  end

  def get_resourcespace_event_image_previews(event_id)
    _event = Event.find(event_id)
    event_title = _event.screening_title
    date = _event.date
    if not event_title.nil?
      # extend ResourcespaceHelper
      request = ResourcespaceHelper::RSpaceRequest.new
      response = request.search_get_previews(search_string="#{event_title}",resource_type=6)
      # puts response.body
      return response
    else
      request = ResourcespaceHelper::RSpaceRequest.new
      response = request.search_get_previews(search_string="fulleventdate:#{date}",resource_type=6)

    end

  end


end
