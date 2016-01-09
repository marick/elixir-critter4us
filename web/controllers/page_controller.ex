defmodule Critter4us.PageController do
  use Critter4us.Web, :controller
  require Logger
  import Openmaize.AccessControl

  plug Openmaize.Login, [unique_id: :login]  when action in [:login_user]
  plug Openmaize.Logout when action in [:logout]

  plug :authorize, [roles: ["superuser", "admin", "requester"]] when action in [:index]

  def index(conn, _params) do
    if conn.assigns.current_user do
      render conn, "index.html"
    else
      redirect(conn, to: "/login")
    end
  end

  def login(conn, _params) do
    render conn, "login.html"
  end

end
