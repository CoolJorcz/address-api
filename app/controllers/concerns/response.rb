module Response
  def json_response(object, status = :ok)
    render json: object, status: status, adapter: :json
  end
end