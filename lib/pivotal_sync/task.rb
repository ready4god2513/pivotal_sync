module PivotalSync
  class Task
    include HappyMapper
    
    class << self
      
      def all(project_id, story_id)
        parse(Client.connection["projects/#{project_id}/stories/#{story_id}/tasks"].get)
      end
      
    end
    
    element :id, Integer
    element :description, String
    element :position, Integer
    element :complete, Boolean
    element :created_at, DateTime
  end
end