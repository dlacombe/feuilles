require "spec_helper"

describe GlsController do
  describe "routing" do

    it "routes to #index" do
      get("/gls").should route_to("gls#index")
    end

    it "routes to #new" do
      get("/gls/new").should route_to("gls#new")
    end

    it "routes to #show" do
      get("/gls/1").should route_to("gls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gls/1/edit").should route_to("gls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gls").should route_to("gls#create")
    end

    it "routes to #update" do
      put("/gls/1").should route_to("gls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gls/1").should route_to("gls#destroy", :id => "1")
    end

  end
end
