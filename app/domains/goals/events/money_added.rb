module Goals
  module Events
    class MoneyAdded < ::Event
      attribute :goal_id, Types::UUID
      attribute :amount, Types::Coercible::Decimal
    end
  end
end
