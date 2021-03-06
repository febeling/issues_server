defmodule PlanProp.Projections.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  require Logger

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Logger.debug "#{__MODULE__} starts"

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: PlanProp.Projections.Worker.start_link(arg1, arg2, arg3)
      # worker(PlanProp.Projections.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlanProp.Projections.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
