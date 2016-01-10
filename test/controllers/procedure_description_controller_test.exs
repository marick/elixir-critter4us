defmodule Critter4us.ProcedureDescriptionControllerTest do
  use Critter4us.ConnCase

  alias Critter4us.ProcedureDescription
  @valid_attrs %{animal_kind: "some content", description: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, procedure_description_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing procedure descriptions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, procedure_description_path(conn, :new)
    assert html_response(conn, 200) =~ "New procedure description"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, procedure_description_path(conn, :create), procedure_description: @valid_attrs
    assert redirected_to(conn) == procedure_description_path(conn, :index)
    assert Repo.get_by(ProcedureDescription, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, procedure_description_path(conn, :create), procedure_description: @invalid_attrs
    assert html_response(conn, 200) =~ "New procedure description"
  end

  test "shows chosen resource", %{conn: conn} do
    procedure_description = Repo.insert! %ProcedureDescription{}
    conn = get conn, procedure_description_path(conn, :show, procedure_description)
    assert html_response(conn, 200) =~ "Show procedure description"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, procedure_description_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    procedure_description = Repo.insert! %ProcedureDescription{}
    conn = get conn, procedure_description_path(conn, :edit, procedure_description)
    assert html_response(conn, 200) =~ "Edit procedure description"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    procedure_description = Repo.insert! %ProcedureDescription{}
    conn = put conn, procedure_description_path(conn, :update, procedure_description), procedure_description: @valid_attrs
    assert redirected_to(conn) == procedure_description_path(conn, :show, procedure_description)
    assert Repo.get_by(ProcedureDescription, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    procedure_description = Repo.insert! %ProcedureDescription{}
    conn = put conn, procedure_description_path(conn, :update, procedure_description), procedure_description: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit procedure description"
  end

  test "deletes chosen resource", %{conn: conn} do
    procedure_description = Repo.insert! %ProcedureDescription{}
    conn = delete conn, procedure_description_path(conn, :delete, procedure_description)
    assert redirected_to(conn) == procedure_description_path(conn, :index)
    refute Repo.get(ProcedureDescription, procedure_description.id)
  end
end
