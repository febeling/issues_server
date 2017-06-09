defmodule PlanProp.Issues.IssueCommandHandler do
  @behaviour Commanded.Commands.Handler

  # The handler applies the commands to the aggregate and makes zero
  # or more events from it. It can also add to it things like creating
  # a unique URL slug.
  #
  # The handler needs to handle all commands the system knows.

  alias PlanProp.Commands.{
    CreateIssue,
  }
  alias PlanProp.Issues.Issue
  # alias PlanProp.Issues.Services.UrlSlugs.UniqueSlugger

  def handle(%Issue{} = issue, %CreateIssue{issue_uuid: issue_uuid, description: description, status: status} = create_issue) do
    issue
    |> Issue.create_issue(
      %CreateIssue{create_issue |
                   created_at: DateTime.utc_now(),
                   updated_at: DateTime.utc_now()
      }
    )
  end

  # match all commands
  
  # def handle(%Issue{} = challenge, %StartIssue{} = start_challenge) do
  #   challenge
  #   |> Issue.start_challenge(start_challenge)
  # end
end
