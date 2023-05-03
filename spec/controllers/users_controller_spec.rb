# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do

  describe "#index" do
    render_views
    it "renders correctly" do
      get :new

      expect(response).to be_ok
    end
  end

  describe "#new" do
    render_views

    it "renders correctly" do
      get :new

      expect(response).to be_ok
    end
  end

  describe "#create" do
    context "with valid params" do
      let(:params) { { user: { first_name: "Test", sur_name: "zhang" } } }

      it "creates a new user" do
        expect { post :create, params: params }.to change(User, :count).by(1)

        #expect(flash[:success]).to eq "User created"

        user = User.last
        expect(user.first_name).to eq "Test"
        expect(user.sur_name).to eq "zhang"

        expect(response).to redirect_to user_path(user)
      end
    end
  end

  describe "#show" do
    let(:params) { { user: { first_name: "Ruby", sur_name: "Users" } } }
    render_views

    it "renders correctly" do
      expect { post :create, params: params }.to change(User, :count).by(1)
      user = User.last
      get :show, params: { id: user.to_param }

      expect(response).to be_ok
    end
  end

  describe "#edit" do
    let(:params) { { user: { first_name: "Ruby", sur_name: "Users" } } }
    render_views

    it "renders correctly" do
      expect { post :create, params: params }.to change(User, :count).by(1)
      user = User.last
      get :edit, params: { id: user.to_param }

      expect(response).to be_ok
    end
  end
end


