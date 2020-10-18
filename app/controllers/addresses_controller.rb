class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses
  def index
    if address_params[:q]
      @addresses = Address.search_by_full_address(params[:q])
    else
      @addresses = Address.all
    end

    json_response(@addresses)
  end

  # POST /addresses
  def create
    @address = Address.create!(address_params)
    json_response(@address, :created)
  end

  # GET /addresses/:id
  def show
    json_response(@address)
  end

  # PUT /addresses/:id
  def update
    @address.update(address_params)
    head :no_content
  end

  # DELETE /addresses/:id
  def destroy
    @address.destroy
    head :no_content
  end

  private

  def address_params
    # whitelist params
    params.permit(:line1, :line2, :city, :state, :zip, :q)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
