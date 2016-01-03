defmodule Critter4us.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :login, :string
      add :institution, :string
      add :password_hash, :string
      add :role, :string

      timestamps
    end

    create unique_index :users, [:login]
  end
end
