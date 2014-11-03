class Ticket
  attr_accessor :parking_lot_id, :car_id

  def initialize(parking_lot_id, car_id)
    @parking_lot_id = parking_lot_id
    @car_id = car_id
  end
end