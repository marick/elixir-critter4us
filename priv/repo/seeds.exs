# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Critter4us.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

users = [
  %{
    login: "requester",
    institution: "uicvm",
    password_hash: Comeonin.Bcrypt.hashpwsalt("requester"),
    role: "requester",
  },
  %{
    login: "admin",
    institution: "uicvm",
    password_hash: Comeonin.Bcrypt.hashpwsalt("admin"),
    role: "admin",
  },
  %{
    login: "root",
    institution: "uicvm",
    password_hash: Comeonin.Bcrypt.hashpwsalt("root"),
    role: "superuser",
  },
]

for user <- users do
  Map.merge(%Critter4us.User{}, user) |> Critter4us.Repo.insert!
end
