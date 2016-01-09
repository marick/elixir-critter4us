defmodule Critter4us.ProcedureTest do
  use Critter4us.ModelCase

  alias Critter4us.Procedure

  @valid_attrs %{days_delay: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Procedure.changeset(%Procedure{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Procedure.changeset(%Procedure{}, @invalid_attrs)
    refute changeset.valid?
  end
end
