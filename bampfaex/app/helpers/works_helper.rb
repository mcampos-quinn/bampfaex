module WorksHelper
  def list_work_people(work_id: @work_id,role: @role)
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
  def list_work_events(work_id: @work_id,role: @role)
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

  def render_thumb_link(blob_csid, doc_id)
    doc_url = "https://cinefiles.bampfa.berkeley.edu/catalog/#{doc_id}"
    thumb_url= "https://webapps.cspace.berkeley.edu/cinefiles/imageserver/blobs/#{blob_csid}/derivatives/Medium/content"
    tag = "<a href='#{doc_url}'><img class='' style='max-width: 200px' src='#{thumb_url}'></a>"
  end

  def list_cinefiles_thumbs(film_title: @film_title)
    film_title = CGI.escape film_title
    url = URI.parse("https://webapps.cspace.berkeley.edu/solr/cinefiles-public/select?q=title_ss:%22#{film_title}%22")
    puts url
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port,use_ssl: true) {|http| http.request(req) }
    hash_response = JSON.parse(res.body)
    docs = hash_response['response']['docs']
    puts docs
    thumbs = []
    docs.each do |doc|
      doc_id = doc['id']
      blob_csid = doc['blob_ss'][0]
      thumb_link = render_thumb_link(blob_csid,doc_id)
      thumbs << thumb_link
    end
    return thumbs
  end
end
