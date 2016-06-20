require_relative '../rails_helper'

RSpec.describe User, type: :model do


  it 'has a username' do
    aUser = User.new
    aUser.username = "username"
    expect(aUser.username).to eq ("username")
  end

  it 'has an email' do
    aUser = User.new
    aUser.email = 'adamcar@gmail.com'
    expect(aUser.email).to eq ('adamcar@gmail.com')
  end

  it 'has a password' do
  	aUser = User.new
  	aUser.password = 'toby1645'
  	expect(aUser.password).to eq ('toby1645')
  end

  it 'has a user id' do
  	aUser = User.new
  	aUser.id = 1
  	expect(aUser.id).to eq (1)
  end

  it 'has a sign in count' do
  	aUser = User.new
  	aUser.sign_in_count = 1
  	expect(aUser.sign_in_count).to eq (1)
  end


end
