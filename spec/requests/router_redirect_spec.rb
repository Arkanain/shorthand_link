require 'rails_helper'

describe 'Router redirect' do
  let(:link) { create(:link) }

  it 'should redirect to original link' do
    get "/#{link.short_link}"

    expect(response).to redirect_to(link.original_link)
  end
end