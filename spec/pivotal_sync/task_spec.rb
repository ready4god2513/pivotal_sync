require "spec_helper"

describe PivotalSync::Task do

  before(:each) { @file = File.open("#{RSpec.configuration.fixture_path}tasks.xml", "rb") }
  after(:each) { @file.close }

  let(:tasks) { PivotalSync::Task.parse(@file.read) }

  context "tasks" do
    subject(:task) { tasks.first }

    it "should have many tasks" do
      tasks.should be_a(Array)
      tasks.count.should == 3
    end

    its(:id) { should  == 13346287 }
    its(:description) { should  == "Get" }
    its(:position) { should  == 1 }
    its(:complete) { should  == false }
    its(:created_at) { should  == DateTime.parse("2013-03-19T21:25:27+00:00") }
  end

end