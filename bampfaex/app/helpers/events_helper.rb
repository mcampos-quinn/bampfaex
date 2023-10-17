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

  def list_internet_archive_recordings(event_id: event_id)
    require 'net/http'
    _event = Event.find(event_id)
    date = _event.date
    # screening_title = _event.screening_title
    unless date.nil?
      ia_query = "https://archive.org/advancedsearch.php?q=(date:[#{date}])+AND+collection%3A(pacificfilmarchive)+AND+text%3A(%22#{}%22)&fl[]=identifier&rows=5&page=1&output=json#raw"
      # this alternative query adds the screening title, but that's so often blank...
      # ia_query = "https://archive.org/advancedsearch.php?q=(date:[#{date}])+AND+collection%3A(pacificfilmarchive)+AND+text%3A(%22#{screening_title}%22)&rows=5&page=1&output=json#raw"
      url = URI.parse(ia_query)
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port,use_ssl: true) {|http| http.request(req) }
      hash_response = JSON.parse(res.body)
      ia_response = hash_response['response']
      docs = ia_response['docs']
      embed_links = []
      docs.each do |d|
        embed_links << "<iframe src='https://archive.org/embed/#{d['identifier']}' width='500' height='60' frameborder='0' webkitallowfullscreen='true' mozallowfullscreen='true' allowfullscreen></iframe>"
      end
      return embed_links
    end
  end


end
