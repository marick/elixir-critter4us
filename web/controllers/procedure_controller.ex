defmodule Critter4us.ProcedureController do
  use Critter4us.Web, :controller

  alias Critter4us.Procedure

  plug :scrub_params, "procedure" when action in [:create, :update]

  def index(conn, _params) do
    procedures = Repo.all(Procedure)
    render(conn, "index.html", procedures: procedures)
  end

  def new(conn, _params) do
    changeset = Procedure.changeset(%Procedure{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"procedure" => procedure_params}) do
    changeset = Procedure.changeset(%Procedure{}, procedure_params)

    case Repo.insert(changeset) do
      {:ok, _procedure} ->
        conn
        |> put_flash(:info, "Procedure created successfully.")
        |> redirect(to: procedure_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    procedure = Repo.get!(Procedure, id)
    render(conn, "show.html", procedure: procedure)
  end

  def edit(conn, %{"id" => id}) do
    procedure = Repo.get!(Procedure, id)
    changeset = Procedure.changeset(procedure)
    render(conn, "edit.html", procedure: procedure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "procedure" => procedure_params}) do
    procedure = Repo.get!(Procedure, id)
    changeset = Procedure.changeset(procedure, procedure_params)

    case Repo.update(changeset) do
      {:ok, procedure} ->
        conn
        |> put_flash(:info, "Procedure updated successfully.")
        |> redirect(to: procedure_path(conn, :show, procedure))
      {:error, changeset} ->
        render(conn, "edit.html", procedure: procedure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    procedure = Repo.get!(Procedure, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(procedure)

    conn
    |> put_flash(:info, "Procedure deleted successfully.")
    |> redirect(to: procedure_path(conn, :index))
  end
end
