defmodule Critter4us.UserTest do
  use Critter4us.ModelCase
  require Map
  require Logger

  alias Critter4us.User

  @required_attrs %{login: "login", password_hash: "password_hash", role: "admin", institution: "tute"}
  @invalid_attrs %{derp: "max"}

  test "changeset with valid attributes succeeds" do
    changeset = User.changeset(%User{}, @required_attrs)
    assert changeset.valid?
  end

  test "all valid attributes are required" do
    changeset = User.changeset(%User{}, Map.delete(@required_attrs, :login))
    refute changeset.valid?
  end

  # validations


  # constraints

  test "login must be unique" do
    changeset = User.changeset(%User{}, @required_attrs)
    assert {:ok, _} = Repo.insert(changeset)
    assert {:error, _} = Repo.insert(changeset)
  end


  IO.puts "== Need tests for auth_changeset"
  IO.puts "== Also need a `todo` function if pending tests cause errors"
end
