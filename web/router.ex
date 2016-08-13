defmodule WhereItsDue.Router do
  use WhereItsDue.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WhereItsDue do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", WhereItsDue do
    pipe_through :api

    resources "/games", GameController
    resources "/franchises", FranchiseController
  end

  forward "/graphql", Absinthe.Plug, schema: WhereItsDue.Schema

  # Other scopes may use custom stacks.
  # scope "/api", WhereItsDue do
  #   pipe_through :api
  # end
end
