defmodule PlapProp.Web.PageController do
  use PlapProp.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
