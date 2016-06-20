require_relative '../rails_helper'

RSpec.describe Following, type: :model do

  it "has a follower" do
    aUser = User.new
    bUser = User.new
    aUser.id = 1
    bUser.id = 2
    following = Following.new
    following.followed_id = bUser.id
    following.user_id = aUser.id
    expect(following.user_id).to eq (1)
    expect(following.followed_id).to eq (2)
  end

  it "can unfollow a user" do
    aUser = User.new
    bUser = User.new
    aUser.id = 1
    bUser.id = 2
    following = Following.new
    following.followed_id = bUser.id
    following.user_id = aUser.id
    expect(following.user_id).to eq (1)
    expect(following.followed_id).to eq (2)
    following.followed_id = nil
    following.user_id = nil
    expect(following.user_id).to eq (nil)
    expect(following.followed_id).to eq (nil)
  end

  it "can follow multiple users" do
    aUser = User.new
    bUser = User.new
    cUser = User.new
    aUser.id = 1
    bUser.id = 2
    cUser.id = 3
    aFollowing = Following.new
    aFollowing.followed_id = bUser.id
    aFollowing.user_id = aUser.id
    expect(aFollowing.user_id).to eq (1)
    expect(aFollowing.followed_id).to eq (2)
    bFollowing = Following.new
    bFollowing.followed_id = cUser.id
    bFollowing.user_id = aUser.id
    expect(bFollowing.user_id).to eq (1)
    expect(bFollowing.followed_id).to eq (3)
  end

end
