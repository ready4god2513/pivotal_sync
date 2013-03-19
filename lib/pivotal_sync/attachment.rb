module PivotalSync
  class Attachment
    include HappyMapper
    
    element :id, Integer
    element :filename, String
    element :url, String
    element :uploaded_at, DateTime
    has_one :uploaded_by, Person
  end
end