require "rails_helper"

RSpec.describe GuidesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/guides").to route_to("guides#index")
    end

    it "routes to #new" do
      expect(:get => "/guides/new").to route_to("guides#new")
    end

    it "routes to #show" do
      expect(:get => "/guides/1").to route_to("guides#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/guides/1/edit").to route_to("guides#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/guides").to route_to("guides#create")
    end

    it "routes to #update" do
      expect(:put => "/guides/1").to route_to("guides#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guides/1").to route_to("guides#destroy", :id => "1")
    end

  end
end
