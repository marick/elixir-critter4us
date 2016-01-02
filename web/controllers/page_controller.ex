defmodule Critter4us.PageController do
  use Critter4us.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
