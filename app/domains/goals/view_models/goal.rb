module Goals
  module ViewModels
    class Goal < ApplicationRecord
      self.table_name = 'goals'

      enum state: [ :draft, :active, :completed ]
    end
  end
end
