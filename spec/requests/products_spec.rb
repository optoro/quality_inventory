require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    let :headers do
      { 'Accept' => 'application/json' }
    end

    it "works! (now write some real specs)" do
      get products_path, headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
