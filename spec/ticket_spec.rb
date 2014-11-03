require 'spec_helper'

describe 'Ticket' do
  context 'given a ticket' do
    let(:parking_lot) {ParkingLot.new(3)}
    let(:car) {Car.new}
    let(:ticket) { Ticket.new(parking_lot.id, car.id) }
    specify { expect(ticket.parking_lot_id).to eq(parking_lot.id) }
    specify { expect(ticket.car_id).to eq(car.id) }
  end
end