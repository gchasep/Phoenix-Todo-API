defmodule TodoApi.Router do
  use TodoApi.Web, :router

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

  scope "/", TodoApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/todos", TodoController
  end

  scope "/api", TodoApi do
    pipe_through :api

    resources "/todos", TodoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoApi do
  #   pipe_through :api
  # end
end
