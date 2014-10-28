require 'spec_helper'

describe 'parking lot' do

  let(:parking_lot) { ParkingLot.new(2) }
  let(:car) { Car.new }

  describe 'parking' do

    subject(:park) { parking_lot.park(car) }

    context 'parking lot is not full' do

      before(:example) do
        3.times { parking_lot.park(Car.new) }
      end

      it 'should park successful' do
        expect(park).not_to be_nil
      end

      it 'should park in the second sub parking lot' do
        expect(park).to include("#{parking_lot.sub_parking_lots[1].id}/")
      end
    end

    context 'parking lot is full' do
      before(:example) do
        4.times { parking_lot.park(Car.new) }
      end

      it 'should fail park' do
        expect(park).to be_nil
      end
    end
  end

  describe 'retrieving' do

    context 'car is not in the parking lot' do
      it 'should retrieve failed' do
        expect(parking_lot.retrieve('ticket_id')).to be_nil
      end
    end

    context 'car is in the parking lot' do

      let(:ticket_id) { parking_lot.park(car) }
      subject(:retrieve) { parking_lot.retrieve(ticket_id) }

      it 'should get the car' do
        expect(retrieve).to eq(car)
      end
    end
  end

end