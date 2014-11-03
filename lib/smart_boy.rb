class SmartBoy < Boy
  def first_available_parking_lot
    parking_lots.
        find_all { |lot| lot.available_carports > 0 }.
        sort { |lot1, lot2| lot1.available_carports + lot2.available_carports }.first
  end
end