class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map do |unit|
      unit.renter_name
    end
  end

  def average_rent
    total_rent = @units.sum do |unit|
      unit.monthly_rent.to_f
    end

    total_rent / @units.length
  end

  def rented_units
    @units.find_all do |unit|
      unit.renter != nil
      # !unit.renter.nil?
      # unit.renter
    end
  end

  def renter_with_highest_rent
    priciest_digs = rented_units.max_by do |unit|
      unit.monthly_rent
    end
    priciest_digs.renter
  end

  def units_by_number_of_bedrooms
    # grouped_units = {}
    # @units.each do |unit|
    #   grouped_units[unit.bedrooms] = [] if grouped_units[unit.bedrooms].nil?
    #   grouped_units[unit.bedrooms] << unit.number
    # end
    # grouped_units

    @units.reduce({}) do |acc, unit|
      acc[unit.bedrooms] = [] if acc[unit.bedrooms].nil?
      acc[unit.bedrooms] << unit.number
      acc
    end
  end

  def annual_breakdown
    breakdown = {}
    rented_units.each do |unit|
      breakdown[unit.renter_name] = unit.monthly_rent * 12
    end
    breakdown
  end

  def rooms_by_renter
    rooms_by_renter = {}
    rented_units.each do |unit|
      rooms_by_renter[unit.renter] = {
        bedrooms: unit.bedrooms,
        bathrooms: unit.bathrooms
      }
    end
    rooms_by_renter
  end
end
