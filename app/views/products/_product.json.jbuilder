json.extract! product, :id, :name, :status, :destination, :profitabily_rate, :minimum_period_for_realization, :administration_fee, :due_date, :created_at, :updated_at
json.url product_url(product, format: :json)
