defmodule PlanProp.Issues.Router do
  use Commanded.Commands.Router

  alias PlanProp.Issues.{IssueCommandHandler}
  alias PlanProp.Issues.Issue

  # middleware Commanded.Middleware.Auditing
  middleware Commanded.Middleware.Logger
  # middleware PlanProp.Infrastructure.Validation.Middleware

  dispatch [
    PlanProp.Commands.CreateIssue,
  ], to: IssueCommandHandler, aggregate: Issue, identity: :issue_uuid
end
