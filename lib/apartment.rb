class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms,
              :renter

  def initialize(apartment_params)
    @number = apartment_params[:number]
    @monthly_rent = apartment_params[:monthly_rent]
    @bathrooms = apartment_params[:bathrooms]
    @bedrooms = apartment_params[:bedrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end

  def renter_name
    return "No Renter" if @renter.nil?
    @renter.name
  end
end
