module Goals
  class GoalRepository
    def initialize(event_store = Rails.configuration.event_store)
      @repository = AggregateRoot::Repository.new(event_store)
    end

    def with_goal(goal_id, &block)
      stream_name = "Goal$#{goal_id}"
      repository.with_aggregate(Goals::Goal.new(goal_id), stream_name, &block)
    end

    private

    attr_reader :repository
  end
end