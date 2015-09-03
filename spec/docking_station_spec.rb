require 'docking_station'
require 'spec_helper'

describe DockingStation do
	it { expect(subject).to respond_to :release_bike }
	it "releases working bikes" do
		# expect(subject.release_bike).to be_an_instance_of(Bike)
		# expect(subject.release_bike).to be_working
	end
  it { expect(subject).to respond_to(:dock).with(1).argument }

  describe "#release_bike" do
    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end
end