defmodule Critter4us.ProcedureDescriptionTest do
  use Critter4us.ModelCase

  alias Critter4us.ProcedureDescription

  @valid_attrs %{animal_kind: "some content", description: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ProcedureDescription.changeset(%ProcedureDescription{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ProcedureDescription.changeset(%ProcedureDescription{}, @invalid_attrs)
    refute changeset.valid?
  end
end
