defmodule PlanProp.Events.IssueCreated do
  defstruct [
    :issue_uuid,
    :author_uuid,
    :type,
    :status,
    :description,
    :location,
    :created_at
  ]
end
