require 'sub_parking_lot'

class ParkingLot

  def initialize(num = 1)
    @sub_parking_lots = []
    num.times do |index|
      @sub_parking_lots.push(SubParkingLot.new(index))
    end
  end

  def park(car)
    sub_parking_lot = first_available_sub_parking_lot
    unless sub_parking_lot.nil?
      carport_id = sub_parking_lot.park(car)
      Ticket.new(sub_parking_lot.id, carport_id).id
    end
  end

  def retrieve(ticket_id)
    ticket = Ticket.find(ticket_id)
    sub_parking_lot = find_sub_parking_lot(ticket.sub_parking_lot_id)
    sub_parking_lot.retrieve(ticket.carport_id) unless sub_parking_lot.nil?
  end

  def sub_parking_lots
    @sub_parking_lots
  end

  private

  def find_sub_parking_lot(id)
    @sub_parking_lots[id.to_i]
  end

  def available_carports
    @sub_parking_lots.reduce(0) { |sum, lot| sum + lot.available_carports }
  end

  def first_available_sub_parking_lot
    @sub_parking_lots.find { |lot| lot.available_carports > 0 }
  end

end