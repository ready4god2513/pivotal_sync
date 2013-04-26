module PivotalSync
  
  class Comment
    include HappyMapper
    
    class << self
      
      def all(project_id, story_id)
        parse(Client.connection["projects/#{project_id}/stories/#{story_id}/comments"].get)
      end
      
    end
    
    element :id, Integer
    element :text, String
    element :created_at, DateTime
    has_one :author, Person
  end
end