defmodule PlanProp.Issues.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Logger.debug "#{__MODULE__} starts"

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: PlanProp.Issues.Worker.start_link(arg1, arg2, arg3)
      # worker(PlanProp.Issues.Worker, [arg1, arg2, arg3]),
      worker(PlanProp.Issues.Supervisor, []),

      # non-persistent store
      #worker(Commanded.EventStore.Adapters.InMemory, [])

      # eventstore using postgres configured
      #worker(Commanded.EventStore.Adapters.EventStore, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
