defmodule Critter4us.ExclusionRuleControllerTest do
  use Critter4us.ConnCase

  alias Critter4us.ExclusionRule
  @valid_attrs %{rule: "some content"}
  @invalid_attrs %{}

  setup do
    {:ok, conn: conn()}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, exclusion_rule_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing exclusion rules"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, exclusion_rule_path(conn, :new)
    assert html_response(conn, 200) =~ "New exclusion rule"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, exclusion_rule_path(conn, :create), exclusion_rule: @valid_attrs
    assert redirected_to(conn) == exclusion_rule_path(conn, :index)
    assert Repo.get_by(ExclusionRule, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, exclusion_rule_path(conn, :create), exclusion_rule: @invalid_attrs
    assert html_response(conn, 200) =~ "New exclusion rule"
  end

  test "shows chosen resource", %{conn: conn} do
    exclusion_rule = Repo.insert! %ExclusionRule{}
    conn = get conn, exclusion_rule_path(conn, :show, exclusion_rule)
    assert html_response(conn, 200) =~ "Show exclusion rule"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, exclusion_rule_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    exclusion_rule = Repo.insert! %ExclusionRule{}
    conn = get conn, exclusion_rule_path(conn, :edit, exclusion_rule)
    assert html_response(conn, 200) =~ "Edit exclusion rule"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    exclusion_rule = Repo.insert! %ExclusionRule{}
    conn = put conn, exclusion_rule_path(conn, :update, exclusion_rule), exclusion_rule: @valid_attrs
    assert redirected_to(conn) == exclusion_rule_path(conn, :show, exclusion_rule)
    assert Repo.get_by(ExclusionRule, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    exclusion_rule = Repo.insert! %ExclusionRule{}
    conn = put conn, exclusion_rule_path(conn, :update, exclusion_rule), exclusion_rule: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit exclusion rule"
  end

  test "deletes chosen resource", %{conn: conn} do
    exclusion_rule = Repo.insert! %ExclusionRule{}
    conn = delete conn, exclusion_rule_path(conn, :delete, exclusion_rule)
    assert redirected_to(conn) == exclusion_rule_path(conn, :index)
    refute Repo.get(ExclusionRule, exclusion_rule.id)
  end
end
