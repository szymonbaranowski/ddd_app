module Goals
  module EventHandlers
    class OnGoalActivated
      def call(event)
        goal = ::Goals::ViewModels::Goal.find_by(id: event.data[:goal_id])
        goal.active!
      end
    end
  end
end
