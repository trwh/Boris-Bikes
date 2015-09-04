require 'docking_station'
require 'spec_helper'

describe DockingStation do

  it "can be initialized with one or no arguments" do
    expect(DockingStation).to respond_to(:new).with(1).argument
  end

  it { expect(subject).to respond_to :release_bike }

  it "releases working bikes" do
    subject.dock Bike.new
		# expect(subject.release_bike).to be_an_instance_of(Bike)
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
      bike = Bike.new
      bike.report_broken
      subject.dock bike
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "returns only working bikes" do
      working_bike = Bike.new

      broken_bike = Bike.new
      broken_bike.report_broken

      # Make a "working bike sandwich", to catch if a bike is just being taken from the start or end of the array.
      subject.dock(broken_bike)
      subject.dock(working_bike)
      subject.dock(broken_bike)

      expect(subject.release_bike).to be_working
    end

  end

  describe "#dock" do

    it "raises an error when full" do
    	subject.capacity.times { subject.dock(Bike.new) }
			expect { subject.dock(Bike.new) }.to raise_error "Docking station full"
    end

  end

end
