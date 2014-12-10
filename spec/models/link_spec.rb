require 'rails_helper'

RSpec.describe Link, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:link)).to be_valid
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:link, title: nil)).to be_invalid
  end

  it "is invalid without an url" do
    expect(FactoryGirl.build(:link, url: nil)).to be_invalid
  end
end
