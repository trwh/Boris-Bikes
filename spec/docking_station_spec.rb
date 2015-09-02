require 'docking_station'

describe DockingStation do
	it { should respond_to(:release_bike) }
	it "releases working bikes" do 
		subject.release_bike.should be_an_instance_of(Bike)
		expect(subject.release_bike).to be_working
	end
end