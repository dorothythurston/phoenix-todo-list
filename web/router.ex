defmodule PhoenixTodoList.Router do
  use PhoenixTodoList.Web, :router

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

  scope "/", PhoenixTodoList do
    pipe_through :browser # Use the default browser stack

    get "/", ListController, :index

    resources "/lists", ListController, only: [:new, :create, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixTodoList do
  #   pipe_through :api
  # end
end
