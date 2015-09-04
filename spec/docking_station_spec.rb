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

  end

  describe "#dock" do

    it "raises an error when full" do
    	subject.capacity.times { subject.dock(Bike.new) }
			expect { subject.dock(Bike.new) }.to raise_error "Docking station full"
    end

  end

end
