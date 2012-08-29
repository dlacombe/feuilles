require 'spec_helper'

describe "Utilisateurs" do
  describe "GET /utilisateurs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get utilisateurs_path
      response.status.should be(200)
    end
  end
end
