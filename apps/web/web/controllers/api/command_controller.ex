defmodule PlanProp.Web.API.CommandController do
  use PlanProp.Web.Web, :controller

  require Logger

  import Canada.Can, only: [can?: 3]

  alias PlanProp.Authorisation.User
  alias PlanProp.Issues.Router
  alias PlanProp.Web.CommandBuilder

  @empty_json_response ""

  @doc """
  Dispatch the command defined in the `params`
  """
  def dispatch(conn, %{"command" => command} = params) do
    Logger.debug "#{__MODULE__} dispatching command: #{inspect(command)}"
    command = CommandBuilder.build(command, conn, Map.delete(params, "command"))
    #user = current_user(conn)

    #if can?(user, :dispatch, command) do
      case Router.dispatch(command) do
        :ok ->
          Logger.debug "#{__MODULE__} - success"
          conn
          |> send_resp(201, @empty_json_response)

        {:error, :validation_failure, errors} ->
          Logger.debug "#{__MODULE__} - validation failure: #{errors}"
          conn
          |> put_status(:unprocessable_entity)
          |> render(:dispatch, errors: errors)

        {:error, reason} ->
          Logger.debug "#{__MODULE__} error, reason: #{reason}"
          conn
          |> send_resp(400, @empty_json_response)
      end
  # else
  #     conn
  #     |> send_resp(403, @empty_json_response)
  #   end
  end

  @doc """
  Attempted to dispatch missing command
  """
  def dispatch(conn, params) do
    Logger.debug "#{__MODULE__} missing command: #{inspect(params)}"
    conn
    |> send_resp(400, @empty_json_response)
  end

  defp current_user(conn) do
    case current_athlete_uuid(conn) do
      nil -> nil
      athlete_uuid -> %User{email: "florian.ebeling@gmail.com"}
    end
  end
end
