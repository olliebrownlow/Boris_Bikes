require 'bike'

describe Bike do
	it 'responds to #working?' do
		bike = Bike.new
		expect(bike).to respond_to(:working?)
	end

	it 'responds to #report_broken' do
		bike = Bike.new
		expect(bike).to respond_to(:report_broken)
	end

	it 'reports a broken bike' do
		bike = Bike.new
		bike.report_broken
		expect(bike.working?).to eq(false)
	end
end
