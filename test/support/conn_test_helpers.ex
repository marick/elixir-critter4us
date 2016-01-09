defmodule Critter4us.ConnTestHelpers do
  alias Openmaize.Token.Create, as: Token
  import Phoenix.ConnTest

  def authenticated() do 
    {:ok, user_token} = %{id: 2, login: "derp", role: "admin"} |> Token.generate_token(:login, {0, 86400})

    conn()
    |> put_req_cookie("access_token", user_token)
  end
end
