defmodule PlanProp.Web.Router do
  use PlanProp.Web.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    # plug :fetch_session
    # plug :assign_current_user
  end

  scope "/", PlanProp.Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", PlanProp.Web do
    pipe_through :api

    post "/commands", API.CommandController, :dispatch
  end
end
