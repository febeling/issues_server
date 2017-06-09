defmodule PlanProp.Issues.Issue do
  @moduledoc """
  Issues domain model.

  It only contains command functions and state mutators.

  The command functions receive the root state and a command and
  return zero or more events. 

  State mutators receive the events individually together with the
  aggregate state and return said state mutated.

  """

  defstruct [
    project_uuid: nil,
    issue_uuid: nil,
    issue_state: nil,
    description: nil,
    created_at: nil,
    updated_at: nil,
    author_uuid: nil,
    planner_uuid: nil,
    responsible_uuid: nil,
    type: nil,
    status: nil,
    due_on: nil,
    location: nil,
    notes: [],
    images: [],
    documents: [],
    attributes: [],
    links: []
  ]

  alias PlanProp.Commands.{
    CreateIssue,
    # UpdateIssue,
    # DeleteIssue,
    # ChangeIssueState,
    # ChangeIssueType,
    # AddNoteToIssue,
    # ChangeNote,
    # AddPhotoToIssue,
    # DeletePhotoFromIssue
    # AddNoteTranscription,
  }

  alias PlanProp.Events.{
    IssueCreated,
    # IssueUpdated,
    # IssueDeleted,
    # IssueStateChanged,
    # IssueTypeChanged,
    # NoteAddedToIssue,
    # NoteChanged,
    # PhotoAddedToIssue,
    # PhotoDeletedFromIssue
  }

  alias PlanProp.Issues.Issue

  @doc """
  Create a new issue
  """
  def create_issue(issue, create_issue)

  def create_issue(%Issue{}, %CreateIssue{} = create_issue) do
    %IssueCreated{
      issue_uuid: create_issue.issue_uuid,
      author_uuid: create_issue.author_uuid,
      type: create_issue.type,
      status: create_issue.status,
      description: create_issue.description,
      location: create_issue.location,
      created_at: create_issue.created_at
    } 
  end

  # def create_issue(%Issue{}, %CreateIssue{}), do: {:error, :error_reason}

  # def update_issue(%Issue{}, %UpdateIssue{} = update_issue) do
  #   %IssueUpdated{
  #     type: update_issue.type,
  #     status: update_issue.status,
  #     description: update_issue.description,
  #     location: update_issue.location
  #   }
  # end

  # def update_issue(%Issue{}, %UpdateIssue{}), do: {:error, :error_reason}

  def apply(%Issue{} = issue, %IssueCreated{
  issue_uuid: uuid, author_uuid: author_uuid, type: type,
  status: status, description: description,
  location: location, created_at: created_at
}) do
    %Issue{issue |
           issue_uuid: uuid,
           issue_state: :created,
           author_uuid: author_uuid,
           type: type,
           status: status,
           description: description,
           location: location,
           created_at: created_at
    }
  end

  # def apply(%Issue{} = issue, %IssueUpdated{uuid: uuid, author_uuid: author_uuid, type: type, status: status, description: description, location: location, updated_at: updated_at}) do
  #   %Issue{issue |
  #          uuid: uuid,
  #          type: type,
  #          status: status,
  #          description: description,
  #          location: location,
  #          updated_at: updated_at
  #   }
  # end

  # def apply(%Issue{} = issue, %IssueDeleted{uuid: uuid, updated_at: updated_at}) do
  #   %Issue{
  #     issue |
  #     issue_state: :deleted,
  #     updated_at: updated_at
  #   }
  # end
  
end
