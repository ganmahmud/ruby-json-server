class ApplicationController < ActionController::API
  before_action :load_data

  def index
    resource_key = params[:resource]
    if @data.key?(resource_key)
      render json: @data[resource_key]
    else
      render json: { error: "#{params[:resource]} not found" }, status: 404
    end
  end


  def full_json
    # ...
  end

  def show
    # ...
  end

  def create
    # ...
  end

  def update
    # ...
  end

  def destroy
    # ...
  end

  private

  def load_data
    # ...
  end

  private

  def save_data
    # ...
  end

  # Utils
  def find_index_by_id(resource_data, id)
    # ...
  end

  def find_item_by_field(resource_data, field, value)
    # ...
  end
end
