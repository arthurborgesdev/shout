require 'rails_helper'

RSpec.describe Yell, type: :model do
  it 'accepts a valid message' do
    user1 = User.create(username: 'arthurborges', full_name: 'Arthur Borges')
    yell1 = user1.yells.create(text: "HELP! I'M OVERWHELMED!!")
    expect(yell1.valid?).to eq(true)
  end

  it 'does not accept a message from without an user' do
    yell1 = Yell.create(text: "HELP! I'M OVERWHELMED!!")
    expect(yell1.valid?).to eq(false)
  end

  it 'does not accept a empty message' do
    yell1 = Yell.create
    expect(yell1.valid?).to eq(false)
  end

  it 'destroys a yell successfully' do
    DatabaseCleaner.clean
    user1 = User.create(username: 'arthurborges', full_name: 'Arthur Borges')
    yell1 = user1.yells.create(text: "I'M GETTING OUTTA HERE!")

    expect { yell1.destroy }.to change { Yell.count }.by(-1)
  end
end
