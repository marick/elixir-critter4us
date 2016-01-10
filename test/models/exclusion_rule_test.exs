defmodule Critter4us.ExclusionRuleTest do
  use Critter4us.ModelCase

  alias Critter4us.ExclusionRule

  @valid_attrs %{rule: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ExclusionRule.changeset(%ExclusionRule{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ExclusionRule.changeset(%ExclusionRule{}, @invalid_attrs)
    refute changeset.valid?
  end
end
