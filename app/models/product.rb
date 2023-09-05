class Product < ApplicationRecord

    STATUS_OPTIONS = ['Disponível', 'Indisponível']

    validates :status, inclusion: { in: STATUS_OPTIONS }
    validates :name, length: { maximum: 32 }
    validates :destination,length:  { maximum: 180 }
    validates :profitabily_rate, inclusion: { in: 1..20 }
    validates :minimum_period_for_realization, inclusion: { in: 0..48 }
    validates :administration_fee, numericality: { only_integer: false }
    validates :due_date, presence: true
    validates :daily_liquidity, numericality: { only_integer: false }


    validate :due_date_must_be_after_minimum_period

  
    private
  
    def due_date_must_be_after_minimum_period
      departure_date = created_at.blank? ? Date.today : created_at.to_date

      minimum_due_date = departure_date + minimum_period_for_realization.months
  
      if due_date < minimum_due_date
        errors.add(:due_date, "deve ser pelo menos #{minimum_period_for_realization} meses após a data de criação")
      end
    end
end
