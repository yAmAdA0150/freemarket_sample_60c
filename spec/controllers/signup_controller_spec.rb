require 'rails_helper'

RSpec.describe SignupController, type: :controller do
  # include SpecTestHelper

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #registration' do
    it "renders the :registration template" do
      get :registration
      expect(response).to render_template :registration
    end
  end

  describe 'GET #sms_confirmation' do
    it "renders the :sms_confirmation template without session" do
      get :sms_confirmation
      expect(response).to render_template :sms_confirmation
    end

    it "renders the :sms_confirmation  template with session" do
      session = {first_validation: "first_validation"}
      add_session(session)
      get :sms_confirmation
      expect(response).to render_template :sms_confirmation
    end
  end

  describe 'GET #address' do
    it "renders the :address template without session" do
      get :address
      expect(response).to redirect_to(signup_index_path)
    end

    it "renders the :address template with session" do
      session = {second_validation: "second_validation"}
      add_session(session)
      get :address
      expect(response).to render_template :address
    end
  end

  describe 'GET #creditcard' do
    it "renders the :creditcard template without session" do
      get :creditcard
      expect(response).to render_template :creditcard
    end
  end

  describe 'GET #complete' do
    it "renders the :complete template with session" do
      get :complete
      expect(response).to render_template :complete
    end
  end

end
