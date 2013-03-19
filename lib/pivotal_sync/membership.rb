module PivotalSync
  class Membership
    include HappyMapper
    
    element :id, Integer
    element :role, String
    element :user_id, Integer, tag: "id", deep: true
    element :name, String, deep: true
    element :email, String, deep: true
    element :initials, String, deep: true 
  end
end