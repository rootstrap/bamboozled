require "spec_helper"

RSpec.describe "Reports" do
  before do
    @client = Bamboozled.client(subdomain: "x", api_key: "x")
  end

<<<<<<< HEAD
  context "When there are no date filters" do
    it "Creates a custom report" do
      response = File.new("spec/fixtures/custom_report.json")
      stub_request(:any, /.*api\.bamboohr\.com.*/).to_return(response)
  
      employees = @client.report.custom(%w[bestEmail employeeNumber birthday])
  
      expect(employees).to be_an Array
      expect(employees.size).to eq 2
    end
  end
=======
  it "Creates a custom report" do
    response = File.new("spec/fixtures/custom_report.json")
    stub_request(:any, /.*api\.bamboohr\.com.*/).to_return(response)
    filters =  []
    employees = @client.report.custom(%w[bestEmail employeeNumber birthday], filters)
    employees_array = JSON.parse(employees)["employees"]
>>>>>>> 885b3de (updates based on comments)

  context "When there are last changed date filters" do
    it "Creates a filtered custom report" do
      response = File.new("spec/fixtures/custom_report_filtered.json")
      stub_request(:any, /.*api\.bamboohr\.com.*/).to_return(response)
  
      employees = @client.report.custom(%w[bestEmail employeeNumber birthday], true,
                                        "2023-04-03T00:00:00Z")
  
      expect(employees).to be_an Array
      expect(employees.size).to eq 1
    end
  end
end
