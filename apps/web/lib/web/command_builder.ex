defmodule PlanProp.Web.CommandBuilder do

  alias PlanProp.Commands.CreateIssue

  def build(
    %{
      "issue_uuid" => issue_uuid,
      "author_uuid" => author_uuid,
      "type" => type,
      "status" => status,
      "description" => description,
      "location" => location,
      "created_at" => created_at
    } = json,
    _conn,
    _params
  ) do
    %CreateIssue{
      issue_uuid: issue_uuid,
      author_uuid: author_uuid,
      type: type, status: status,
      description: description,
      location: location,
      created_at: created_at
    }
  end
  
end
