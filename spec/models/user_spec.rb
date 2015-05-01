require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it 'is invalid without an email' do
    expect(FactoryGirl.build(:user, email: nil)).to be_invalid
  end

  it 'is invalid without a correct email' do
    expect(FactoryGirl.build(:user, email: 'dddd')).to be_invalid
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:user, name: nil)).to be_invalid
  end
end
