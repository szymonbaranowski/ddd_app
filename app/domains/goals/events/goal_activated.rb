module Goals
  module Events
    class GoalActivated < ::Event
      attribute :goal_id, Types::UUID
    end
  end
end
