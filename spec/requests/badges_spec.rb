require 'rails_helper'

RSpec.describe "Badges", type: :request do
  let(:student) { create(:user) }
  describe "GET /badges" do
    before do
      sign_in student
    end
    
    it "works! (now write some real specs)" do
      get badges_path
      expect(response).to have_http_status(200)
    end
  end
end
