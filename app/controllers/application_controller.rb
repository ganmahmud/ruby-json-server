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
    render json: @data
  end


  def show
    resource_key = params[:resource]
    id = params[:id].to_i
    item = find_item_by_field(@data[resource_key], "id", id)

    if item
      render json: item, status: 200
    else
      render json: { error: "#{resource_key} item with ID #{id} not found" }, status: 404
    end
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
