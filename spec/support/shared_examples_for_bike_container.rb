shared_examples_for BikeContainer do
  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end
  it "can be initialized with any capacity" do
    testing_capacity = rand(100)
    subject = described_class.new(testing_capacity)
    expect(subject.capacity).to eq testing_capacity
  end
end