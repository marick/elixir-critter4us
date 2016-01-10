defmodule Critter4us.ProcedureDescriptionController do
  use Critter4us.Web, :controller

  alias Critter4us.ProcedureDescription

  plug :scrub_params, "procedure_description" when action in [:create, :update]

  def index(conn, _params) do
    procedure_descriptions = Repo.all(ProcedureDescription)
    render(conn, "index.html", procedure_descriptions: procedure_descriptions)
  end

  def new(conn, _params) do
    changeset = ProcedureDescription.changeset(%ProcedureDescription{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"procedure_description" => procedure_description_params}) do
    changeset = ProcedureDescription.changeset(%ProcedureDescription{}, procedure_description_params)

    case Repo.insert(changeset) do
      {:ok, _procedure_description} ->
        conn
        |> put_flash(:info, "Procedure description created successfully.")
        |> redirect(to: procedure_description_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    procedure_description = Repo.get!(ProcedureDescription, id)
    render(conn, "show.html", procedure_description: procedure_description)
  end

  def edit(conn, %{"id" => id}) do
    procedure_description = Repo.get!(ProcedureDescription, id)
    changeset = ProcedureDescription.changeset(procedure_description)
    render(conn, "edit.html", procedure_description: procedure_description, changeset: changeset)
  end

  def update(conn, %{"id" => id, "procedure_description" => procedure_description_params}) do
    procedure_description = Repo.get!(ProcedureDescription, id)
    changeset = ProcedureDescription.changeset(procedure_description, procedure_description_params)

    case Repo.update(changeset) do
      {:ok, procedure_description} ->
        conn
        |> put_flash(:info, "Procedure description updated successfully.")
        |> redirect(to: procedure_description_path(conn, :show, procedure_description))
      {:error, changeset} ->
        render(conn, "edit.html", procedure_description: procedure_description, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    procedure_description = Repo.get!(ProcedureDescription, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(procedure_description)

    conn
    |> put_flash(:info, "Procedure description deleted successfully.")
    |> redirect(to: procedure_description_path(conn, :index))
  end
end
