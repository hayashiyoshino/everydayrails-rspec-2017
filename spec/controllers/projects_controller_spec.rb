require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
	describe '#index' do
		let!(:user) { create(:user) }

	  it 'returns a 200 response' do
			sign_in user
	    get :index
			expect(response).to have_http_status 200
		end

		context 'as a guest' do
		  it 'returns a 302 response' do
		    get :index
				expect(response).to have_http_status 302
			end

			it 'redirects to the sign in page' do
			  get :index
				expect(response).to redirect_to '/users/sign_in'
			end
		end
	end
end
