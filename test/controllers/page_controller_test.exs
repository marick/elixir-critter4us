defmodule Critter4us.PageControllerTest do
  use Critter4us.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Login"
  end
end
