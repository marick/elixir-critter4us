defmodule Critter4us.PageController do
  use Critter4us.Web, :controller
  require Logger
  import Openmaize.AccessControl

  plug Openmaize.Login when action in [:login_user]
  plug Openmaize.Logout when action in [:logout]

#  plug :authorize, roles: ["superuser", "admin", "requester"]

  def index(conn, _params) do
    if conn.assigns.current_user do
      Logger.info(inspect conn.assigns)
      render conn, "index.html"
    else
      Logger.info("NUIL NBUL NLI")
      redirect(conn, to: "/login")
    end
  end

  def login(conn, _params) do
    render conn, "login.html"
  end

end
