defmodule Critter4us.Repo.Migrations.AddProcedureTimestamps do
  use Ecto.Migration

  def change do
    alter table(:procedures) do 
      add :inserted_at, :datetime, default: fragment("now()")
      add :updated_at, :datetime, default: fragment("now()")
    end
  end
end
