require "spec_helper"

describe LinkedAccountsController do
  describe "routing" do

    it "routes to #index" do
      get("/linked_accounts").should route_to("linked_accounts#index")
    end

    it "routes to #new" do
      get("/linked_accounts/new").should route_to("linked_accounts#new")
    end

    it "routes to #show" do
      get("/linked_accounts/1").should route_to("linked_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/linked_accounts/1/edit").should route_to("linked_accounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/linked_accounts").should route_to("linked_accounts#create")
    end

    it "routes to #update" do
      put("/linked_accounts/1").should route_to("linked_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/linked_accounts/1").should route_to("linked_accounts#destroy", :id => "1")
    end

  end
end
