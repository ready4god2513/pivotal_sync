module PivotalSync
  
  class Story
    include HappyMapper
    
    class << self
      
      def all(project_id)
        parse(Client.connection["projects/#{project_id}/stories"].get)
      end
      
      def find(id)
        parse(Client.connection["stories/#{id}"].get)
      end
      
    end
    
    tag "story"
    element :id, Integer
    element :project_id, Integer
    element :story_type, String
    element :url, String
    element :estimate, Float
    element :current_state, String
    element :description, String
    element :name, String
    element :created_at, DateTime
    element :updated_at, DateTime
    element :accepted_at, DateTime
    element :labels, String
    has_one :owned_by, Person
    has_one :requested_by, Person
    has_many :attachments, Attachment
    has_many :comments, Comment
    
    def project
      Project.find(project_id)
    end
    
    def tasks
      Task.all(project_id, id)
    end
    
  end
end