require 'rails_helper'

RSpec.describe "LinksNavbars", type: :request do
  describe "GET /links_navbars" do
    it "works! (now write some real specs)" do
      get links_navbars_path
      expect(response).to have_http_status(200)
    end
  end
end
