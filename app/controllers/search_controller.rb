class SearchController < ApplicationController
  
  def addresses
    @addresses = Address.search_by_full_address(search_params[:q])
    json_response(@addresses)
  end

  private

  def search_params
    params.permit(:q)
  end
end
