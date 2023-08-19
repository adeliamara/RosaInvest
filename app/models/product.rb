class Product < ApplicationRecord

    STATUS_OPTIONS = ['Disponível', 'Indisponível']

    validates :status, inclusion: { in: STATUS_OPTIONS }
    validates :name, length: { maximum: 32 }
    validates :destination,length:  { maximum: 180 }
    validates :profitabily_rate, inclusion: { in: 1..20 }
    validates :minimum_period_for_realization, inclusion: { in: 0..48 }
    validates :administration_fee, numericality: { only_integer: false }
    validates :due_date, presence: true
end
