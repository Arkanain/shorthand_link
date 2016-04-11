require 'rails_helper'

describe LinksController do
  let(:new_link_params) { attributes_for(:link) }

  it 'should get list of link' do
    2.times { create(:link) }

    get :index

    expect(response).to render_template(:index)
    expect(assigns[:links].length).to eq(2)
  end

  it 'should add new link in a system' do
    post :create, link: new_link_params, format: :js

    expect(assigns[:link].original_link).to eq(new_link_params[:original_link])
  end
end