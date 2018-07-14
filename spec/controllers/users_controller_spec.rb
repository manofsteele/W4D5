require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do 
    it 'renders the new user signup page' do 
      get :new 
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end 
  end
  
  describe 'POST #create' do
    context 'with valid params' do 
      it 'validates the presence of username and password' do
        post :create, params: { user: { username: 'nadav', password: '123456', email: 'n@n.com'} }
        expect(response).to redirect_to(user_url(User.last.id))
        
      end
    end 
    
    context 'with invalid params' do 
      it 'validates the presence of username, email, and password' do 
        post :create, params: { user: { username: 'nadav', password: '123456'} }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present 
      end
    end 
  end 
  
  
end
