# Index, new, create, destroy
require 'rails_helper'

RSpec.describe UsersController, type: :controller do 

    describe 'GET #index' do
        it 'renders users index' do 
            get :index 
            expect(response).to render_template(:index)
        end
    end

    describe 'Get #new' do 
        it 'renders sign up page' do 
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'DELETE #destroy' do 
        let!(:user) {create(:user)}
        
        before (:each) do
            delete :destroy, params: {id: user.id} 
        end

        it 'should delete the user' do 
            expect(User.exists?(user.id)).to be(false)
        end
    end

    describe 'POST #create' do
    before(:each) do 
        create(:user)
    end
    
    let(:valid_params) {{user: {username: 'mannu', password: 'magicsl'}}}
    let(:invalid_params) {{user: {nothing: 'dkjfs', something: 'magic'}}}

    context 'with valid params' do
        it 'should create a new user' do
            post :create, params: valid_params
            expect(User.last.username).to eq('mannu') 
        end
        it 'should redirect_to index page' do
            post :create, params: valid_params
            expect(response).to redirect_to(users_url)
        end 
    end
    context 'invalid params' do
        before(:each) do 
            post :create, params: invalid_params
        end 
        it 'should stay on page despite error' do
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new) 
        end
        it 'adds errors to the flash errors cookie' do 
            expect(flash[:errors]).to be_present
        end
    end
    end    

end