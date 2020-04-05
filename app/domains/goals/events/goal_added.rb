module Goals
  module Events
    class GoalAdded < ::Event
      attribute :goal_id, ::Types::UUID
    end
  end
end
