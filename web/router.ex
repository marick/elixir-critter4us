defmodule Critter4us.Router do
  use Critter4us.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Openmaize.Authenticate
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Critter4us do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", PageController, :login, as: :login
    post "/login", PageController, :login_user, as: :login
    get "/logout", PageController, :logout, as: :logout
  end

  scope "/admin", Critter4us do
    pipe_through :browser

    get "/", AdminController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Critter4us do
  #   pipe_through :api
  # end
end
