defmodule Critter4us.AdminController do
  use Critter4us.Web, :controller

  import Openmaize.AccessControl
  alias Critter4us.User

  plug :authorize, roles: ["admin"]

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
