module Goals
  module EventHandlers
    class OnMoneyAdded
      def call(event)
        goal = ::Goals::ViewModels::Goal.find_by(id: event.data[:goal_id])
        goal.update!(money_saved: goal.money_saved + event.data[:amount])
      end
    end
  end
end
