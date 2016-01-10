defmodule Critter4us.ExclusionRule do
  use Critter4us.Web, :model

  schema "exclusion_rules" do
    field :rule, :string
    belongs_to :procedure, Critter4us.Procedure

    timestamps
  end

  @required_fields ~w(rule)
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
