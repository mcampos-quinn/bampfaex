module ResourcespaceHelper
  class RSpaceRequest
    # attr_accessor :string_1, :string_2
    def initialize(rs_api_function: nil, parameters: nil)
      @rs_api_function=rs_api_function
      @parameters=parameters
      @rs_user_id=Rails.application.config_for(:secrets).with_indifferent_access['rs_user_id']
      # puts "#{@rs_user_id} ID "*10
      @rs_api_key=Rails.application.config_for(:secrets).with_indifferent_access['rs_api_key']
      # puts "#{@rs_api_key} Key "*10
      @rs_url=Rails.application.config_for(:secrets).with_indifferent_access['rs_url']
      @query_url=nil
    end

    def format_parameters(parameters)
      @parameters = (parameters.map {|key,value| "#{key}=#{value}"}).join("&")
      # puts @parameters.class
    end

    def search_get_previews(search_string=nil,resource_type=nil,size="pre")
      require 'cgi'
      search_string = CGI.escape(search_string.gsub(/[[:punct:]]/, ' '))
      puts search_string
  		@rs_api_function = "search_get_previews"
  		@parameters = format_parameters({
  			"search":search_string,
  			"restypes":resource_type,
  			"getsizes":size
  			})
  		make_query()
  		hash_response = post_query()
      # puts hash_response
      preview_tags = nil
      unless hash_response == []
        preview_tags = make_resourcespace_preview_tags(hash_response)
        # puts preview_tags
        return preview_tags
      end
    end

    def make_query
      require 'digest'
  		query = "user=#{@rs_user_id}&function=#{@rs_api_function}&#{@parameters}"
      combined = "#{@rs_api_key}#{query}"
      # puts combined
      sign = Digest::SHA256.hexdigest(combined)
      # puts sign
  		@query_url = "#{@rs_url}/api/?#{query}&sign=#{sign}"
  		puts @query_url
      return @query_url
    end

    def post_query
      hash_response = nil
  		unless @query_url.nil?
        require 'net/http'
        url = URI.parse(@query_url)
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port,use_ssl: true) {|http| http.request(req) }
        hash_response = ''
        unless res.body.blank?
          hash_response = JSON.parse(res.body)
        end
        return hash_response
      end
    end
  end
end

def get_caption(ref)
  requester = ResourcespaceHelper::RSpaceRequest.new(
    rs_api_function: "get_resource_field_data",
    parameters: format_parameters({
      "resource":ref
      })
  )
  requester.make_query()
  hash_response = requester.post_query()
  value = ""
  unless hash_response.blank?
    hash_response.each do |item|
      if item['name'] == 'caption'
        value = item['value']
        break
      end
    end
  end
  return value
end

def make_resourcespace_preview_tags(hash_response)
  tags = []
  counter = 0
  puts "counter"
  hash_response.each do |hit|
    puts counter
    # puts hit['url_pre']
    _hit = {}
    _hit['caption'] = ''
    # caption =''
    caption = get_caption(hit['ref'])
    if not caption.blank?
      _hit['caption'] = "<p class='carousel-caption'>#{caption}</p>"
    end
    if not hit['url_pre'].nil?
      url = hit['url_pre']
      _hit["img"] = "<img class='d-block h-100' src='#{url}' alt='#{caption}'/>"
    else
      requester = ResourcespaceHelper::RSpaceRequest.new(
        rs_api_function: "get_resource_path",
        parameters: format_parameters({
    			"ref":hit['ref']
    			})
      )
      requester.make_query()
      hash_response = requester.post_query()
      _hit["img"] = "<img class='d-block w-100' style='max-height: 300px' src='#{hash_response}' alt='#{caption}'/>"
    end
    # puts _hit
    tags << _hit
    counter = counter + 1
    if counter == 5
      break
    end
  end
  # puts tags
  return tags[0..4]
end
