class Boy
  def initialize(parking_lots)
    @parking_lots = parking_lots
  end

  def park(car)
    parking_lot = first_available_parking_lot
    return nil if parking_lot.nil?
    car_id = parking_lot.park(car)
    Ticket.new(parking_lot.id, car_id)
  end

  def retrieve(ticket)
    unless ticket.parking_lot_id.nil?
      @parking_lots.inject([]) { |sum, lot| sum.push(lot.retrieve(ticket.car_id)) }.compact.first
    end
  end

  protected

  def first_available_parking_lot
    @parking_lots.find { |lot| lot.available_carports > 0 }
  end

  def parking_lots
    @parking_lots
  end
end