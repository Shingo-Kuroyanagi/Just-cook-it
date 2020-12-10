require 'rails_helper'

RSpec.describe "PostFoodComments", type: :request do
  describe "GET /post_food_comments" do
    it "works! (now write some real specs)" do
      get post_food_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
