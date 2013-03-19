module PivotalSync
  class Iteration
    include HappyMapper
    
    class << self
      
      def all(project_id)
        @all ||= parse(Client.connection["projects/#{project_id}/iterations"].get)
      end
      
    end
    
    element :id, Integer
    element :number, Integer
    element :start, DateTime
    element :finish, DateTime
    element :team_strength, Float
    has_many :stories, Story
  end
end