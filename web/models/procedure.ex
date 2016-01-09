defmodule Critter4us.Procedure do
  use Critter4us.Web, :model

  schema "procedures" do
    field :name, :string
    field :days_delay, :integer

    timestamps
  end

  @required_fields ~w(name days_delay)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
