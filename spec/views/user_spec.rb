require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', email: 'test@gmail.com', password: 'test12345') }

  before { subject.save }

  it 'No name should be invalid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'No email should be invalid' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Name length should be less than 50' do
    subject.name = 'b' * 55
    expect(subject).to_not be_valid
  end
end
