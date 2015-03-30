require "rails_helper"

RSpec.describe StatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stats").to route_to("stats#index")
    end

    it "routes to #new" do
      expect(:get => "/stats/new").to route_to("stats#new")
    end

    it "routes to #show" do
      expect(:get => "/stats/1").to route_to("stats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stats/1/edit").to route_to("stats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stats").to route_to("stats#create")
    end

    it "routes to #update" do
      expect(:put => "/stats/1").to route_to("stats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stats/1").to route_to("stats#destroy", :id => "1")
    end

  end
end
