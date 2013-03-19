require "spec_helper"

describe PivotalSync::Project do
  
  before(:each) { @file = File.open("#{RSpec.configuration.fixture_path}projects.xml", "rb") }
  after(:each) { @file.close }
  
  let(:projects) { PivotalSync::Project.parse(@file.read) }
  let(:project) { projects.first }
  
  context "data" do
    
    it "should be an array of projects" do
      projects.should be_a(Array)
    end
    
    it "should have id" do
      project.id.should_not be_nil
    end
    
    it "should have name" do
      project.name.should_not be_nil
    end
    
  end
  
  context "associations" do
    
    context "memberships" do
      
      let(:membership) { project.memberships.first }
      
      it "should have many memberships" do
        project.memberships.should be_a(Array)
      end
      
      it "should have an id" do
        membership.id.should_not be_nil
      end
      
      it "should have a name" do
        membership.name.should_not be_nil
      end
      
    end
    
    context "iterations" do
      
      it "should have many iterations" do
        project.iterations.should be_a(Array)
      end
      
    end
    
    context "stories" do
      
      it "should have many stories" do
        project.stories.should be_a(Array)
      end
      
    end
    
    it "should have many integrations" do
      project.integrations.should be_a(Array)
    end
    
  end
  
end