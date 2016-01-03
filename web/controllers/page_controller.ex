defmodule Critter4us.PageController do
  use Critter4us.Web, :controller

  plug Openmaize.Login when action in [:login_user]
  plug Openmaize.Logout when action in [:logout]

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login(conn, _params) do
    render conn, "login.html"
  end

end
