require "spec_helper"

describe PivotalSync::Membership do
  
  before(:each) { @file = File.open("#{RSpec.configuration.fixture_path}memberships.xml", "rb") }
  after(:each) { @file.close }

  let(:memberships) { PivotalSync::Membership.parse(@file.read) }

  context "memberships" do
    subject(:membership) { memberships.first }

    it "should have many memberships" do
      memberships.should be_a(Array)
      memberships.count.should == 1
    end

    its(:id) { should  == 2930385 }
    its(:role) { should  == "Owner" }
    its(:name) { should  == "Brandon Hansen" }
    its(:initials) { should  == "BH" }
    its(:email) { should  == nil }
  end
end