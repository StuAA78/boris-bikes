class Bike

  attr_accessor :broken

  def broken?
    @broken
  end

  def working?
    !@broken
  end

end
