module PivotalSync
  
  class Client
    
    class << self
      
      attr_writer :token

      def connection
        raise NoToken if @token.to_s.empty?
        
        @connections ||= {}
        @connections[@token] ||= RestClient::Resource.new("#{tracker_url}#{api_path}", :headers => {
          "X-TrackerToken" => @token, 
          "Content-Type" => "application/xml"
        })
      end

      protected

      def tracker_url
        "https://www.pivotaltracker.com"
      end

      def api_path
        "/services/v4/"
      end
      
    end
    
  end
  
end