defmodule Critter4us.AdminControllerTest do
  use Critter4us.ConnCase
  require Critter4us.AdminController

  @index_path admin_path(conn(), :index)

  setup do
    conn = authenticated()
    {:ok, authenticated: conn}
  end

  test "GET / when not logged in redirects" do
    unauthorized_conn = conn()
    result = get(unauthorized_conn, @index_path)
    # IO.inspect result
    assert redirected_to(result) == "/login"
  end

  test "GET / when logged in", %{authenticated: conn}  do
    conn = get conn, "/"
    # IO.inspect conn
    assert html_response(conn, 200)
  end
end
