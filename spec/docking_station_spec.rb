require 'docking_station'
require 'spec_helper'

describe DockingStation do

  it "can be initialized with one or no arguments" do
    expect(DockingStation).to respond_to(:new).with(1).argument
  end

  it { expect(subject).to respond_to :release_bike }

  it "releases working bikes" do
    subject.dock (double :test_bike, working?: true)
		expect(subject.release_bike).to be_working
	end

  it { expect(subject).to respond_to(:dock).with(1).argument }

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY

  end

	describe "#release_bike" do

    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "raises an error when only broken bikes are available" do
      subject.dock(double :broken_bike, working?: false)
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "returns only working bikes" do
      # Make a "working bike sandwich", to catch if a bike is just being taken from the start or end of the array.
      subject.dock(double :broken_bike, working?: false)
      subject.dock(double :working_bike, working?: true)
      subject.dock(double :broken_bike, working?: false)

      expect(subject.release_bike).to be_working
    end

  end

  describe "#dock" do

    it "raises an error when full" do
    	subject.capacity.times { subject.dock :test_bike }
			expect { subject.dock :test_bike }.to raise_error "Docking station full"
    end

  end

end
