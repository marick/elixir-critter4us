defmodule Critter4us.ProcedureControllerTest do
  use Critter4us.ConnCase

  alias Critter4us.Procedure
  @valid_attrs %{days_delay: 42, name: "some content"}
  @invalid_attrs %{}

  setup do
    {:ok, conn: conn()}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn(), procedure_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing procedures"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, procedure_path(conn, :new)
    assert html_response(conn, 200) =~ "New procedure"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, procedure_path(conn, :create), procedure: @valid_attrs
    assert redirected_to(conn) == procedure_path(conn, :index)
    assert Repo.get_by(Procedure, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, procedure_path(conn, :create), procedure: @invalid_attrs
    assert html_response(conn, 200) =~ "New procedure"
  end

  test "shows chosen resource", %{conn: conn} do
    procedure = Repo.insert! %Procedure{}
    conn = get conn, procedure_path(conn, :show, procedure)
    assert html_response(conn, 200) =~ "Show procedure"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, procedure_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    procedure = Repo.insert! %Procedure{}
    conn = get conn, procedure_path(conn, :edit, procedure)
    assert html_response(conn, 200) =~ "Edit procedure"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    procedure = Repo.insert! %Procedure{}
    conn = put conn, procedure_path(conn, :update, procedure), procedure: @valid_attrs
    assert redirected_to(conn) == procedure_path(conn, :show, procedure)
    assert Repo.get_by(Procedure, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    procedure = Repo.insert! %Procedure{}
    conn = put conn, procedure_path(conn, :update, procedure), procedure: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit procedure"
  end

  test "deletes chosen resource", %{conn: conn} do
    procedure = Repo.insert! %Procedure{}
    conn = delete conn, procedure_path(conn, :delete, procedure)
    assert redirected_to(conn) == procedure_path(conn, :index)
    refute Repo.get(Procedure, procedure.id)
  end
end
