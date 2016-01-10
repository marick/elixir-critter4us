defmodule Critter4us.ExclusionRuleController do
  use Critter4us.Web, :controller

  alias Critter4us.ExclusionRule

  plug :scrub_params, "exclusion_rule" when action in [:create, :update]

  def index(conn, _params) do
    exclusion_rules = Repo.all(ExclusionRule)
    render(conn, "index.html", exclusion_rules: exclusion_rules)
  end

  def new(conn, _params) do
    changeset = ExclusionRule.changeset(%ExclusionRule{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"exclusion_rule" => exclusion_rule_params}) do
    changeset = ExclusionRule.changeset(%ExclusionRule{}, exclusion_rule_params)

    case Repo.insert(changeset) do
      {:ok, _exclusion_rule} ->
        conn
        |> put_flash(:info, "Exclusion rule created successfully.")
        |> redirect(to: exclusion_rule_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exclusion_rule = Repo.get!(ExclusionRule, id)
    render(conn, "show.html", exclusion_rule: exclusion_rule)
  end

  def edit(conn, %{"id" => id}) do
    exclusion_rule = Repo.get!(ExclusionRule, id)
    changeset = ExclusionRule.changeset(exclusion_rule)
    render(conn, "edit.html", exclusion_rule: exclusion_rule, changeset: changeset)
  end

  def update(conn, %{"id" => id, "exclusion_rule" => exclusion_rule_params}) do
    exclusion_rule = Repo.get!(ExclusionRule, id)
    changeset = ExclusionRule.changeset(exclusion_rule, exclusion_rule_params)

    case Repo.update(changeset) do
      {:ok, exclusion_rule} ->
        conn
        |> put_flash(:info, "Exclusion rule updated successfully.")
        |> redirect(to: exclusion_rule_path(conn, :show, exclusion_rule))
      {:error, changeset} ->
        render(conn, "edit.html", exclusion_rule: exclusion_rule, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exclusion_rule = Repo.get!(ExclusionRule, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(exclusion_rule)

    conn
    |> put_flash(:info, "Exclusion rule deleted successfully.")
    |> redirect(to: exclusion_rule_path(conn, :index))
  end
end
