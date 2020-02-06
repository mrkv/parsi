RSpec.describe ParsePages do
  let(:interactor) { ParsePages.new }
  let(:attributes) { Hash.new }

  it "succeeds" do
    result = interactor.call(attributes)
    expect(result.successful?).to be(true)
  end
end
