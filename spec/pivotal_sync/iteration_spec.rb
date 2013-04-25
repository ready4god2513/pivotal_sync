require "spec_helper"

describe PivotalSync::Iteration do

  before(:each) { @file = File.open("#{RSpec.configuration.fixture_path}iterations.xml", "rb") }
  after(:each) { @file.close }

  let(:iterations) { PivotalSync::Iteration.parse(@file.read) }
  let(:iteration) { iterations.first }
  let(:story) { iteration.stories.first }
  
  context "data" do
    
    it "should be an array of iterations" do
      iterations.should be_a(Array)
    end
    
    it "should have valid data" do
      iteration.id.should == 1
      iteration.number.should == 1
      iteration.start.to_s.should == "2013-03-18T07:00:00+00:00"
      iteration.finish.to_s.should == "2013-03-25T07:00:00+00:00"
      iteration.team_strength.should == 1.0
      iteration.stories.count.should == 1
    end
    
  end
  
  context "associations" do

    context "stories" do
      
      it "should have many stories" do
        iteration.stories.should be_a(Array)
      end

      it "should have valid data" do
        story.id.should == 46499703
        story.project_id.should == 784123
        story.story_type.should == "feature"
        story.url.should == "http://www.pivotaltracker.com/story/show/46499703"
        story.estimate.should == 1.0
        story.current_state.should == "unstarted"
        story.description.should == "This is a description"
        story.name.should == "Just a little test"
        story.labels.should == "123,testing"
        story.created_at.to_s.should == "2013-03-19T21:25:26+00:00"
        story.updated_at.to_s.should == "2013-03-19T21:33:26+00:00"
        story.accepted_at.should == nil
      end


      context "owner" do

        let(:owned_by) { story.owned_by }

        it "should belong to a owner" do
          story.should respond_to(:owned_by)
        end

        it "should be of class person" do
          owned_by.should be_a(PivotalSync::Person)
        end

        it "should have an id" do
          owned_by.id.should == 123456
        end

        it "should be owned by brandon" do
          owned_by.name.should == "Sami Andrew"
        end

        it "should have initials BH" do
          owned_by.initials.should == "SA"
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

        let(:attachment) { story.attachments.first }

        it "should have many attachments" do
          story.attachments.should be_a(Array)
          story.attachments.count.should == 1
        end

        it "should have an id" do
          attachment.id.should == 17148567
          attachment.filename.should == "Screen_Shot_2013-03-19_at_12.01.09_PM.png"
          attachment.uploaded_at.to_s.should == "2013-03-19T21:25:21+00:00"
          attachment.url.should == "https://www.pivotaltracker.com/resource/download/17148567"
        end

        context "uploaded_by" do
          subject(:uploaded_by) { attachment.uploaded_by }

          its(:id) { should  == 126384 }
          its(:name) { should  == "Brandon Hansen" }
          its(:initials) { should  == "BH" }
        end

      end

      context "comments" do
        subject(:comment) { story.comments.first }

        it "should have many comments" do
          story.comments.should be_a(Array)
          story.comments.count.should == 2
        end

        its(:id) { should  == 39331775 }
        its(:text) { should  == "Adding some comments here" }
        its(:created_at) { should  == DateTime.parse("2013-03-19T21:25:27+00:00") }

        context "author" do
          subject(:author) { comment.author }

          its(:id) { should  == 126384 }
          its(:name) { should  == "Brandon Hansen" }
          its(:initials) { should  == "BH" }
        end
      end

      context "tasks" do
        subject(:task) { story.tasks.first }

        it "should have many tasks" do
          story.tasks.should be_a(Array)
          story.tasks.count.should == 3
        end

        its(:id) { should  == 13346287 }
        its(:description) { should  == "Get" }
        its(:position) { should  == 1 }
        its(:complete) { should  == false }
        its(:created_at) { should  == DateTime.parse("2013-03-19T21:25:27+00:00") }
      end

    end
    
  end

end