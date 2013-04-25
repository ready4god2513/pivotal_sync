require "spec_helper"

describe PivotalSync::Attachment do

  before(:each) { @file = File.open("#{RSpec.configuration.fixture_path}attachments.xml", "rb") }
  after(:each) { @file.close }

  let(:attachments) { PivotalSync::Attachment.parse(@file.read) }

  context "attachments" do
    subject(:attachment) { attachments.first }

    it "should have many attachments" do
      attachments.should be_a(Array)
      attachments.count.should == 1
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
end