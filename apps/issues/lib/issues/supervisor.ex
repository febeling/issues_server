defmodule PlanProp.Issues.Supervisor do
  use Supervisor

  #alias PlanProp.Issues
  # alias Issues.{
  #   ChallengeStageProcessManager,
  # }

  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  def init(_) do
    children = [
      # projections
      #supervisor(PlanProp.Issues.Projections.Supervisor, []),

      # process managers
      #worker(Commanded.ProcessManagers.ProcessRouter, ["ChallengeStageProcessManager", ChallengeStageProcessManager, Issues.Router], id: :challenge_stage_process_manager),

      # event handler (mostly for projections)
      #worker(Commanded.Event.Handler, ["IssueCommandHandler", IssueCommandHandler, [start_from: :origin]], id: :issue_uuid)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
