module PivotalSync
  class Project
    include HappyMapper
    
    class << self
      
      def all
        parse(Client.connection["projects"].get)
      end
      
      def find(id)
        parse(Client.connection["projects/#{id}"].get)
      end
      
    end
    
    element :id, Integer
    element :name, String
    element :created_at, DateTime
    element :version, Integer
    element :iteration_length, Integer
    element :week_start_day, String
    element :point_scale, String
    element :account, String
    element :first_iteration_start_time, DateTime
    element :current_iteration_number, Integer
    element :enable_tasks, Boolean
    element :velocity_scheme, String
    element :current_velocity, Integer
    element :initial_velocity, Integer
    element :number_of_done_iterations_to_show, Integer
    element :labels, String
    element :allow_attachments, Boolean
    element :is_public, Boolean, tag: "public"
    element :use_https, Boolean
    element :bugs_and_chores_are_estimatable, Boolean
    element :commit_mode, Boolean
    element :last_activity_at, DateTime
    has_many :memberships, Membership
    has_many :integrations, Integration
    
    def iterations
      Iteration.all(id)
    end
    
    def stories
      iterations.map { |i| i.stories }.flatten
    end
    
  end
end