# frozen_string_literal: true

require "spec_helper"
require "omniauth_clover"

describe OmniAuth::Strategies::Clover do
  def app
    lambda do |_env|
      [200, {}, ["Hello."]]
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  let(:clover_strategy) do
    described_class.new(app, "appid", "secret", {})
  end

  # let(:request) { instance_double(Rack::Request, params: {}, cookies: {}, env: {}) }

  describe "#client_options" do
    it "has correct site" do
      expect(clover_strategy.client.site).to eq("https://www.clover.com")
    end

    it "has correct authorize_url" do
      expect(clover_strategy.client.options[:authorize_url]).to eq("/oauth/authorize")
    end

    it "has correct token_url" do
      expect(clover_strategy.client.options[:token_url]).to eq("/oauth/token")
    end

    describe "overrides" do
      let(:clover_strategy) do
        described_class.new(app, "appid", "secret", options)
      end
      let(:options) {
        {
          client_options: {
            "site" => "https://example.com",
            "authorize_url" => "https://example.com",
            "token_url" => "https://example.com"
          }
        }
      }

      it "allows overriding the site" do
        expect(clover_strategy.client.site).to eq("https://example.com")
      end

      it "allows overriding the authorize_url" do
        expect(clover_strategy.client.options[:authorize_url]).to eq("https://example.com")
      end

      it "allows overriding the token_url" do
        expect(clover_strategy.client.options[:token_url]).to eq("https://example.com")
      end
    end
  end
end
