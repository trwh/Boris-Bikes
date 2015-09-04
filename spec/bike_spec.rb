require 'bike'
require 'spec_helper'


describe Bike do
	it { expect(subject).to respond_to(:working?) }
  it 'can be reported broken' do
    subject.report_broken
    expect(subject).not_to be_working
  end
end
