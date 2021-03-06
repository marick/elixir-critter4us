defmodule Critter4us.Repo.Migrations.AddExclusionRuleTimestamps do
  use Ecto.Migration

  def change do
    alter table(:exclusion_rules) do
      add :inserted_at, :datetime, default: fragment("now()")
      add :updated_at, :datetime, default: fragment("now()")
    end
    create index(:exclusion_rules, [:procedure_id])
  end
end
