defmodule Critter4us.ConnTestHelpers do
  alias Openmaize.Token.Create, as: Token
  import Phoenix.ConnTest

  def authenticated() do 
    {:ok, user_token} = %{id: 2, login: "derp", role: "admin"} |> Token.generate_token({0, 86400})

    result = conn()
    |> put_req_cookie("access_token", user_token)

    :timer.sleep(1)  # Temp this is required to avoid intermittent test failures.
    result
  end
end
