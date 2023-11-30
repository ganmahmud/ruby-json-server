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
    resource_key = params[:resource]
    @data[resource_key] << JSON.parse(params[:application].to_json)
    save_data
    render json: @data[resource_key], status: 201
  end

  def update
    resource_key = params[:resource]
    id = params[:id].to_i
    resource_item = find_item_by_field(@data[resource_key], "id", id)

    if resource_item
      payload = JSON.parse(params[:application].to_json)

      # Update only the fields provided in the payload
      resource_item.merge!(payload)

      save_data
      render json: resource_item, status: 200
    else
      render json: { error: "#{resource_key} item with ID #{id} not found" }, status: 404
    end
  end


  def destroy
    resource_key = params[:resource]
    id = params[:id].to_i
    resource_item_index = find_index_by_id(@data[resource_key], id)

    if resource_item_index
      @data[resource_key].delete_at(resource_item_index)
      save_data
      render json: { message: "#{resource_key} item with ID #{id} deleted" }, status: 200
    else
      render json: { error: "#{resource_key} item with ID #{id} not found" }, status: 404
    end
  end

  private
  def load_data
    @data ||= JSON.parse(File.read("#{Rails.root}/public/db.json"))
  end

  private
  def save_data
    File.write("#{Rails.root}/public/db.json", JSON.pretty_generate(@data))
  end

  # Utils
  def find_index_by_id(resource_data, id)
    resource_data.find_index { |item| item['id'] == id }
  end

  def find_item_by_field(resource_data, field, value)
    resource_data.find { |item| item[field.to_s] == value }
  end

end
