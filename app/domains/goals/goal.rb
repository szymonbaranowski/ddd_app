module Goals
  class Goal
    include AggregateRoot
    class HasBeenAlreadyActivated < StandardError; end
    class IsNotYetActive < StandardError; end
    class HasBeenCompleted < StandardError; end

    def initialize(id)
      @id = id
      @state = :draft
      @money_saved = 0
    end

    def add
      raise HasBeenAlreadyActivated if state == :active
      raise HasBeenCompleted if state == :completed
      apply Events::GoalAdded.new(data: { goal_id: id })
    end

    def activate
      raise HasBeenAlreadyActivated if state == :active
      raise HasBeenCompleted if state == :completed
      apply Events::GoalActivated.new(data: { goal_id: id })
    end

    def add_money(amount)
      raise IsNotYetActive unless state == :active
      raise HasBeenCompleted if state == :completed
      apply Events::MoneyAdded.new(data: { goal_id: id, amount: amount })
    end

    on Events::GoalAdded do |_|
    end

    on Events::GoalActivated do |_|
      @state = :active
    end

    on Events::MoneyAdded do |event|
      @money_saved += event[:amount]
    end

    private

    attr_reader :id, :state, :money_saved
  end
end