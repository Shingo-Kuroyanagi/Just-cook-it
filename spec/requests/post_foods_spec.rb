require 'rails_helper'

RSpec.describe "PostFoods", type: :request do
  describe "GET /post_foods" do
    it "works! (now write some real specs)" do
      get post_foods_path
      expect(response).to have_http_status(200)
    end
  end
end
