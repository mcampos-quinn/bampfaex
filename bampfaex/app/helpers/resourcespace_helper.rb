module ResourcespaceHelper
  class RSpaceRequest
    # attr_accessor :string_1, :string_2
    def initialize(rs_api_function: nil, parameters: nil)
      @rs_api_function=rs_api_function
      @parameters=parameters
      @rs_user_id=Rails.application.config.secrets['rs_user_id']
      # puts "#{@rs_user_id} ID "*10
      @rs_api_key=Rails.application.config.secrets['rs_api_key']
      # puts "#{@rs_api_key} Key "*10
      @rs_url=Rails.application.config.secrets['rs_url']
      @query_url=nil
    end

    def format_parameters(parameters)
      @parameters = (parameters.map {|key,value| "#{key}=#{value}"}).join("&")
      # puts @parameters.class
    end

    def search_get_previews(search_string=nil,resource_type=nil,size="web")
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
      # puts hash_response == []
      preview_tags = nil
      unless hash_response == []
        preview_tags = make_resourcespace_preview_tags(hash_response)
        puts preview_tags
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
        puts res
        hash_response = JSON.parse(res.body)
        return hash_response
      end
    end
  end
end

def make_resourcespace_preview_tags(hash_response)
  tags = []
  hash_response.each do |hit|
    # puts "hit"
    # puts hit['url_web']

    unless hit['url_web'].nil?
      tag = "<img class='' style='max-width: 200px' src='#{hit['url_web']}'/>"
      tags << tag
    end
  end
  # puts tags
  return tags[0..4]
end
