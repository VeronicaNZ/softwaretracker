# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do

  describe "#fullname" do
    let(:user) { User.new(first_name: "veronica", sur_name: "zhang") }

    it "returns the full name including first_name and sur_name for the user" do
      expect(user.fullname).to eq "veronica zhang"
    end
  end
end
