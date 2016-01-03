defmodule Critter4us.User do
  use Critter4us.Web, :model

  alias Openmaize.Signup

  schema "users" do
    # Note: once there's more than one institution, the :login will contain the institution
    # name. Current thinking: this is gotten from a subdomain like uicvm.critter4us.com
    field :login, :string
    field :institution, :string
    field :password_hash, :string
    field :role, :string

    field :password, :string, virtual: true

    timestamps
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(login role), ~w())
    |> validate_length(:login, min: 1, max: 100)
    |> unique_constraint(:login)
  end

  def auth_changeset(model, params) do
    model
    |> changeset(params)
    |> Signup.create_user(params)
  end
end
