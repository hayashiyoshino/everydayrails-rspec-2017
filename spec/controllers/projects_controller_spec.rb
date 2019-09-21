require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
	describe '#index' do

	  context 'authenticated user' do
			let!(:user) { create(:user) }
			it 'returns a 200 response' do
				sign_in user
				get :index
				expect(response).to have_http_status 200
			end
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

	describe '#show' do

		context 'authenticated user' do
			let!(:user) { create(:user) }
			let!(:project) { create(:project, owner: user) }

			it 'returns a 200 response' do
				sign_in user
				get :show, params: { id: project.id }
				expect(response).to have_http_status 200
			end
		end

		# context 'as a guest' do
		# 	it 'returns a 302 response' do
		# 		get :index
		# 		expect(response).to have_http_status 302
		# 	end
		#
		# 	it 'redirects to the sign in page' do
		# 		get :index
		# 		expect(response).to redirect_to '/users/sign_in'
		# 	end
		# end
	end
end
