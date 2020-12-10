require 'rails_helper'

RSpec.describe "PostFoodFavorites", type: :request do
  describe "GET /post_food_favorites" do
    it "works! (now write some real specs)" do
      get post_food_favorites_path
      expect(response).to have_http_status(200)
    end
  end
end
