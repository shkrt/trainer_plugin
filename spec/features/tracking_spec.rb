require "spec_helper"

describe "Tracking activity with ahoy" do
  it "stores specified action" do
    3.times { visit test_index_path }
    Ahoy::Event.take(3).each do |elem|
      expect(elem.name).to eq "index action of test controller invoked"
    end
  end
end
