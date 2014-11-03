require 'spec_helper'

describe 'ParkingLot' do
  let(:parking_lot) { ParkingLot.new(1) }
  let(:car) { Car.new }

  context 'parking' do

    subject(:park) { parking_lot.park(car) }

    context 'when there is available carport' do
      it 'should park the car' do
        expect(park).to eq(car.id)
      end
    end

    context 'when there is no available carport' do

      before(:example) do
        parking_lot.available_carports.times { parking_lot.park(Car.new) }
      end

      it 'should not park the car' do
        expect(park).to be_nil
      end
    end
  end

  context 'retrieving' do

    context 'when the car is parking there' do

      before(:example) { parking_lot.park(car) }

      it 'should retrieve the car' do
        expect(parking_lot.retrieve(car.id)).to eq(car)
      end
    end

    context 'when the car is not parking there' do
      it 'should not retrieve the car' do
        expect(parking_lot.retrieve(car.id)).to be_nil
      end
    end
  end

end