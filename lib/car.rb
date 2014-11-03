class Car
  attr_reader :id

  def initialize
    @id = self.hash
  end
end