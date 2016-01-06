defmodule Critter4us.PageControllerTest do
  use Critter4us.ConnCase

  @index_path page_path(conn(), :index)

  setup do
    conn = authenticated()
    {:ok, authenticated: conn}
  end

  ## These tests do not actually capture what's required to make logging in useful.
  ## 'Cause it's currently not.

  test "GET / when not logged in redirects" do
    unauthorized_conn = conn()
    result = get(unauthorized_conn, @index_path)
    assert redirected_to(result) == "/login"
  end

  test "GET / when logged in", %{authenticated: conn}  do
    conn = get conn, "/"
    assert html_response(conn, 200)
  end
end
