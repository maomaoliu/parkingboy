class ParkingLot
  attr_reader :id

  def initialize(capacity = 2)
    @capacity = capacity
    @carports = {}
    @id = self.hash
  end

  def available_carports
    @capacity - @carports.size
  end

  def park(car)
    return nil if available_carports == 0
    @carports[car.id] = car
    car.id
  end

  def retrieve(car_id)
    @carports.delete(car_id)
  end

end