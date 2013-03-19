module PivotalSync
  class Integration
    include HappyMapper
    
    element :id, Integer
    element :type, String
    element :name, String
    element :field_name, String
    element :field_label, String
    element :active, Boolean 
  end
end