require 'spec_helper'

describe 'SmartBoy' do
  let(:parking_lot_1) { ParkingLot.new }
  let(:parking_lot_2) { ParkingLot.new }
  let(:smart_boy) { SmartBoy.new([parking_lot_1, parking_lot_2]) }
  let(:car) { Car.new }

  describe 'parking' do

    subject(:park) { smart_boy.park(car) }

    context 'parking lot is not full' do

      before(:example) do
        smart_boy.park(Car.new)
      end

      it 'should park successful' do
        expect(park).not_to be_nil
      end

      it 'should park in the parking lot which parks least cars' do
        ticket = park
        expect(ticket.parking_lot_id).to eq(parking_lot_2.id)
      end
    end

    context 'parking lot is full' do
      before(:example) do
        4.times { smart_boy.park(Car.new) }
      end

      it 'should fail park' do
        expect(park).to be_nil
      end
    end
  end

  describe 'retrieving' do

    context 'car is not in the parking lot' do
      it 'should retrieve failed' do
        expect(smart_boy.retrieve(Ticket.new(ParkingLot.new.id, Car.new.id))).to be_nil
      end
    end

    context 'car is in the parking lot' do

      let(:ticket) { smart_boy.park(car) }
      subject(:retrieve) { smart_boy.retrieve(ticket) }

      it 'should get the car' do
        expect(retrieve).to eq(car)
      end
    end
  end

end