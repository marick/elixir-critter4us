defmodule Critter4us.ProcedureView do
  use Critter4us.Web, :view

  def sorted_procedures(procedures) do
    Enum.sort(procedures, &(String.downcase(&1.name) < String.downcase(&2.name)))
  end
end
