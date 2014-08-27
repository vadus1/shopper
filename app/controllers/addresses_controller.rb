class AddressesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    render_form_error_for @address unless @address.save
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    render_form_error_for @address unless @address.update_attributes(address_params)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
  end

  private
    def address_params
      params.require(:address).permit(:street_address, :city, :state, :zip, :country_id, :phone, :user_id, :default)
    end
end
