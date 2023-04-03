require "spec_helper"

RSpec.describe "Bamboozled::Base" do
  let(:base) do
    Bamboozled::Base.new(subdomain: "x", api_key: "x", httparty_options: {log_format: :curl}, api_url: 'https://newapi.com/url/')
  end

  it "passes HTTParty options to Bamboozled::API::Employee constructor" do
    expect(Bamboozled::API::Employee).to receive(:new).with("x", "x", { log_format: :curl }, 'https://newapi.com/url/')
    base.employee
  end
  it "passes HTTParty options to Bamboozled::API::Report constructor" do
    expect(Bamboozled::API::Report).to receive(:new).with("x", "x", { log_format: :curl }, 'https://newapi.com/url/')
    base.report
  end
  it "passes HTTParty options to Bamboozled::API::Meta constructor" do
    expect(Bamboozled::API::Meta).to receive(:new).with("x", "x", { log_format: :curl }, 'https://newapi.com/url/')
    base.meta
  end
  it "passes HTTParty options to Bamboozled::API::TimeOff constructor" do
    expect(Bamboozled::API::TimeOff).to receive(:new).with("x", "x", { log_format: :curl }, 'https://newapi.com/url/')
    base.time_off
  end
  it "passes HTTParty options to Bamboozled::API::TimeTracking constructor" do
    expect(Bamboozled::API::TimeTracking).to receive(:new).with("x", "x", { log_format: :curl }, 'https://newapi.com/url/')
    base.time_tracking
  end
end
