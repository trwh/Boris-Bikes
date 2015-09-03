require 'bike'
require 'spec_helper'


describe Bike do
	it { expect(subject).to respond_to(:working?) }
end
