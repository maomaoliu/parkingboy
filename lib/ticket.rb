class Ticket
  attr_accessor :sub_parking_lot_id, :carport_id

  def initialize(sub_parking_lot_id, carport_id)
    @sub_parking_lot_id = sub_parking_lot_id
    @carport_id = carport_id
  end

  def id
    "#{@sub_parking_lot_id}/#{@carport_id}"
  end

  def self.find(id)
    ids = id.split('/')
    Ticket.new(ids.first.to_i, ids.last.to_i)
  end
end