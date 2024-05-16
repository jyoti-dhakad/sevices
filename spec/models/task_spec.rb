require 'rails_helper'

RSpec.describe Task, type: :model do

  

  it 'is valid with valid attributes' do
    task = FactoryBot.create(:task)
    expect(task).to be_valid
  end

  it 'is not valid with valid attributes' do
    task = Task.create(title:"")
    expect(task).to_not be_valid
  end
end
