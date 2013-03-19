module PivotalSync
  class Membership
    include HappyMapper
    
    element :id, Integer
    element :role, String
    element :name, String, deep: true
    element :email, String, deep: true
    element :initials, String, deep: true 
  end
end