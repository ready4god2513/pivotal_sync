module PivotalSync
  class Attachment
    include HappyMapper
    
    element :id, Integer
    element :filename, String
    element :description, String
    element :uploaded_by, String
    element :uploaded_at, DateTime
    element :url, String
  end
end