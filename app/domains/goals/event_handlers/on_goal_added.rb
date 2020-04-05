module Goals
  module EventHandlers
    class OnGoalAdded
      def call(event)
        goal = ::Goals::ViewModels::Goal.new(id: event.data[:goal_id], state: :draft, money_saved: 0)
        goal.save!
      end
    end
  end
end
