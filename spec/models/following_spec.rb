require 'rails_helper'

RSpec.describe Following, type: :model do
  it 'makes one user follow another' do
    user1 = User.create(full_name: 'Andressa Borges', username: 'andressaborges')
    user2 = User.create(full_name: 'Ariel', username: 'ariel')

    user1.followers.create(followed: user2)
    expect { user1.followers.create(followed: user2) }.to change { Following.count }.by(1)
  end

  it 'successfully unfollow a user' do
    user1 = User.create(full_name: 'Andressa Borges', username: 'andressaborges')
    user2 = User.create(full_name: 'Ariel', username: 'ariel')

    follow = user1.followers.create(followed: user2)
    expect { follow.destroy }.to change { Following.count }.by(-1)
  end
end
