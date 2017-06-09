defmodule PlanProp.Commands.CreateIssue do
  defstruct [
    :issue_uuid,
    :author_uuid,
    :type,
    :status,
    :description,
    :location,
    :created_at,
    :updated_at
  ]

  use Vex.Struct

  validates :uuid, uuid: true
  validates :author_uuid, uuid: true
end
