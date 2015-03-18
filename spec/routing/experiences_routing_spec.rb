require "rails_helper"

RSpec.describe ExperiencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/experiences").to route_to("experiences#index")
    end

    it "routes to #new" do
      expect(:get => "/experiences/new").to route_to("experiences#new")
    end

    it "routes to #show" do
      expect(:get => "/experiences/1").to route_to("experiences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/experiences/1/edit").to route_to("experiences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/experiences").to route_to("experiences#create")
    end

    it "routes to #update" do
      expect(:put => "/experiences/1").to route_to("experiences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/experiences/1").to route_to("experiences#destroy", :id => "1")
    end

  end
end
