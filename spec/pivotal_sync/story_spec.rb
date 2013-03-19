require "spec_helper"

describe PivotalSync::Story do
  
  before(:each) { @file = File.open("#{RSpec.configuration.fixture_path}stories.xml", "rb") }
  after(:each) { @file.close }
  
  let(:stories) { PivotalSync::Story.parse(@file.read) }
  let(:story) { stories.first }
  
  context "data" do
    
    it "should be an array of stories" do
      stories.should be_a(Array)
    end
    
    it "should have id" do
      story.id.should_not be_nil
    end
    
    it "should have labels" do
      story.labels.should_not be_nil
    end
    
  end
  
  context "associations" do
    
    context "owner" do
      
      let(:owned_by) { story.owned_by }
      
      it "should belong to a owner" do
        story.should respond_to(:owned_by)
      end
      
      it "should be of class person" do
        owned_by.should be_a(PivotalSync::Person)
      end
      
      it "should have an id" do
        owned_by.id.should == 126384
      end
      
      it "should be owned by brandon" do
        owned_by.name.should == "Brandon Hansen"
      end
      
      it "should have initials BH" do
        owned_by.initials.should == "BH"
      end
      
    end
    
    context "requester" do
      
      let(:requested_by) { story.requested_by }
      
      it "should belong to a owner" do
        story.should respond_to(:requested_by)
      end
      
      it "should be of class person" do
        requested_by.should be_a(PivotalSync::Person)
      end
      
      it "should have an id" do
        requested_by.id.should == 126384
      end
      
      it "should be requested by brandon" do
        requested_by.name.should == "Brandon Hansen"
      end
      
      it "should have initials BH" do
        requested_by.initials.should == "BH"
      end
      
    end
    
    context "attachments" do
      
      it "should have many attachments" do
        story.tasks.should be_a(Array)
      end
      
    end
    
    context "project" do
      
      it "should belong to a project" do
        story.should respond_to(:project)
      end
      
    end
    
    context "comments" do
      
      it "should have many comments" do
        story.comments.should be_a(Array)
      end
      
    end
    
    context "tasks" do
      
      it "should have many tasks" do
        story.tasks.should be_a(Array)
      end
      
    end
    
  end
  
end