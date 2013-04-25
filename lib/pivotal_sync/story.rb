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
    has_one :owned_by, Person, :tag => 'owned_by'
    has_one :requested_by, Person, :tag => 'requested_by'
    has_many :attachments, Attachment, :tag => 'attachment'
    has_many :comments, Comment, :tag => 'comment'
    has_many :tasks, Task, :tag => 'task'
    
    def project
      Project.find(project_id)
    end
    
    # def tasks
    #   Task.all(project_id, id)
    # end
    
  end
end