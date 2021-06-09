require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a valid user" do
    user1 = User.create(username: "arthurborges", full_name: "Arthur Borges")
    expect(user1.valid?).to eq(true)
  end

  it "not allows the creation of a user without username" do
    user1 = User.create(full_name: "Arthur Borges")
    expect(user1.valid?).to eq(false)
  end

  it "not allows the creation of a user without Full Name" do
    user1 = User.create(username: "arthurborges")
    expect(user1.valid?).to eq(false)
  end
end
