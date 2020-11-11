require 'rails_helper'

describe "get post route", :type => :request do

  before(:each) do
    @post = create(:post)
  end

  it 'get post' do
    get "/v1/posts/#{@post.id}", as: :json
    expect(response).to have_http_status(:success)
    expect(response.body).to eq(@post.to_json)
  end

  it 'get nonexistent post' do
    get "/v1/posts/#{SecureRandom.hex}", as: :json
    expect( response ).to have_http_status(:not_found)
  end
end