require 'rails_helper'

RSpec.describe ItemsController, type: :controller do


    describe "GET #index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
    describe "GET #search" do
    it "renders the :search template" do
      get :search
      expect(@respnse).to render_template :search
    end
  end
  #   describe "GET #new" do
  #   # session = {action:"new",controller:"items"}
  #   it "renders the :new template" do
  #     get :new
  #     expect(respnse).to redirect_to(new_items_path)
  #   end
  # end
  # describe "GET #show" do
  # # session = {action: "show",controller: "items"}
  # it "renders the :show template" do
  #   get :show
  #   expect(respnse).to render_template :show
  #   end
  # end
  # describe "GET #create" do
  # # session = {action: "show",controller: "items"}
  # it "renders the :create template" do
  #   get :create
  #   expect(respnse).to render_template :create
  #   end
  # end

end
