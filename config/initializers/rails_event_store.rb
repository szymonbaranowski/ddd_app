require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  AggregateRoot.configure do |config|
    config.default_event_store = Rails.configuration.event_store
  end

  Rails.configuration.event_store.tap do |store|
    # Goals domain
    store.subscribe(Goals::EventHandlers::OnGoalAdded, to: [Goals::Events::GoalAdded])
    store.subscribe(Goals::EventHandlers::OnGoalActivated, to: [Goals::Events::GoalActivated])
    store.subscribe(Goals::EventHandlers::OnMoneyAdded, to: [Goals::Events::MoneyAdded])
  end
end
