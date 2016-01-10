defmodule Critter4us.Repo.Migrations.AddProcedureDescriptionTimestamps do
  use Ecto.Migration

  def change do
    alter table(:procedure_descriptions) do
      add :inserted_at, :datetime, default: fragment("now()")
      add :updated_at, :datetime, default: fragment("now()")
    end
    create index(:procedure_descriptions, [:procedure_id])
  end
end
