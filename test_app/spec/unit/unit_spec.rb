# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: 'JK Rowlins', price: '20.0', published_date: '1999-12-13')
  end

  it 'is valid with valid attributes' do

    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a published date' do
    subject.published_date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with a price being alphanumeric' do
    subject.price = '123.abc'
    expect(subject).not_to be_valid
  end

  it 'is not valid with a price consisting of only letters' do
    subject.price = 'abc'
    expect(subject).not_to be_valid
  end

  it 'is valid with a price being a string representing a number' do
    subject.price = '123.123'
    expect(subject).to be_valid
  end
end