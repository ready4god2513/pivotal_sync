require "spec_helper"

describe PivotalSync::Comment do

  before(:each) { @file = File.open("#{RSpec.configuration.fixture_path}comments.xml", "rb") }
  after(:each) { @file.close }

  let(:comments) { PivotalSync::Comment.parse(@file.read) }

  context "comments" do
    subject(:comment) { comments.first }

    it "should have many comments" do
      comments.should be_a(Array)
      comments.count.should == 2
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
  
end