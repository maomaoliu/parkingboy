class SubParkingLot
  def initialize(id, capacity = 2)
    @capacity = capacity
    @map = {}
    @id = id
  end

  def available_carports
    @capacity - @map.size
  end

  def park(car)
    unless available_carports == 0
      @map[car.hash] = car
      car.hash
    end
  end

  def retrieve(carport_id)
    @map.delete(carport_id)
  end

  def id
    @id
  end
end