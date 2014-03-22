require "spec_helper"

describe SpatialsController do
  describe "routing" do

    it "routes to #index" do
      get("/spatials").should route_to("spatials#index")
    end

    it "routes to #new" do
      get("/spatials/new").should route_to("spatials#new")
    end

    it "routes to #show" do
      get("/spatials/1").should route_to("spatials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spatials/1/edit").should route_to("spatials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spatials").should route_to("spatials#create")
    end

    it "routes to #update" do
      put("/spatials/1").should route_to("spatials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spatials/1").should route_to("spatials#destroy", :id => "1")
    end

  end
end
