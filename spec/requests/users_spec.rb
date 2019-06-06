require 'rails_helper'

RSpec.describe 'USERS API', type: :request do

    let!(:users) { create_list(:user, 10) }
    let(:user_id) { users.first.id }

    describe 'GET /users' do

        before { get '/users' }

        it 'returns users' do
            expect(json).not_to be_empty
            expect(json.size).to eq(10)   
        end
    
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'GET /users/:id' do

        before { get "/users/#{user_id}" }
        
        context 'if user exists' do
            it 'returns user' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(user_id)  
            end
        
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'if user does not exists' do
        end
    end

    describe 'POST /users' do

        
        context 'on a valid request' do
            let(:valid_attributes) { {username: 'vit', password: '123456', email: 
                'vit@gmail.com', birthday: '03-07-1991'} }
            before { post '/users', params: valid_attributes }
            
            it 'creates user with valid attributes' do
                expect(json['username']).to eq('vit')
            end
            
            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'on a invalid request' do
            before { post '/users', params: { username: 'vit'} }
            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
        end
            
        describe 'DELETE /users/:id' do
          before { delete "/users/#{user_id}" }
        
          it 'returns status code 204' do
            expect(response).to have_http_status(204)
          end
        end
        
        describe 'PUT /todos/:id' do
          let(:valid_attributes) { { username: 'vitka' } }
        
          context 'when the record exists' do
            before { put "/users/#{user_id}", params: valid_attributes }

            it 'updates the user' do
              expect(response.body).to be_empty
            end
        
            it 'returns status code 204' do
              expect(response).to have_http_status(204)
            end
          end
        end

    end
end