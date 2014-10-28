require 'spec_helper'

describe 'SubParkingLot' do
  let(:sub_parking_lot) { SubParkingLot.new(1) }
  let(:car) { Car.new }

  context 'parking' do

    subject(:park) { sub_parking_lot.park(car) }

    context 'when there is available carport' do
      it 'should park the car' do
        expect(park).not_to be_nil
      end

      it 'should get the carport' do
        expect(park).to eq(car.hash)
      end
    end

    context 'when there is no available carport' do

      before(:example) do
        sub_parking_lot.available_carports.times { sub_parking_lot.park(Car.new) }
      end

      it 'should not park the car' do
        expect(park).to be_nil
      end
    end
  end

  context 'retrieving' do

    subject(:retrieve) { sub_parking_lot.retrieve(car.hash) }

    context 'when the car is parking there' do

      before(:example) do
        sub_parking_lot.park(car)
      end

      it 'should retrieve the car' do
        expect(retrieve).to eq(car)
      end
    end

    context 'when the car is not parking there' do

      it 'should not retrieve the car' do
        expect(retrieve).to be_nil
      end
    end
  end

end