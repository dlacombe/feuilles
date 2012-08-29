require "spec_helper"

describe FeuillesController do
  describe "routing" do

    it "routes to #index" do
      get("/feuilles").should route_to("feuilles#index")
    end

    it "routes to #new" do
      get("/feuilles/new").should route_to("feuilles#new")
    end

    it "routes to #show" do
      get("/feuilles/1").should route_to("feuilles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feuilles/1/edit").should route_to("feuilles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feuilles").should route_to("feuilles#create")
    end

    it "routes to #update" do
      put("/feuilles/1").should route_to("feuilles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feuilles/1").should route_to("feuilles#destroy", :id => "1")
    end

  end
end
