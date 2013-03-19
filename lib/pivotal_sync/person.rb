module PivotalSync
  class Person
    include HappyMapper
    
    element :id, Integer, deep: true
    element :email, String, deep: true
    element :name, String, deep: true
    element :initials, String, deep: true
  end
end