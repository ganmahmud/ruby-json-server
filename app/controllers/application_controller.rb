class ApplicationController < ActionController::API
  before_action :load_data

  def index
    # ...
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
