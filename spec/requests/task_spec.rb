require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:task_params) { FactoryBot.attributes_for(:task) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get '/tasks'
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    
    it 'returns a successful response' do
      get '/tasks/:id'
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates task data' do
      post '/tasks', params: { task: task_params }
      expect(response.status).to eq(201)
    end 

    it 'renders the task as JSON' do
      post '/tasks/', params: { task: task_params }
      expect(response.body).to eq(Task.last.to_json)
    end
  end

  describe 'PUT #update' do
    it 'update  task data' do
      task = Task.create(task_params)
      # user = User.create(user_params)
      put "/tasks/#{task.id}/", params: { task: task_params }
      expect(response).to have_http_status(:success)
    end  
  end

  describe 'DELETE #destroy' do
    it 'returns a successful response' do
      task = FactoryBot.create(:task)
      delete task_path(task.id)
      expect(response).to be_successful
    end
  end
end
