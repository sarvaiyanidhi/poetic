defmodule PoeticWeb.Router do
  use PoeticWeb, :router

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

  scope "/", PoeticWeb do
    pipe_through :browser
    resources "/uploads", UploadController, only: [:index, :new, :create, :show]
    get "/", PageController, :index
  end


  # Other scopes may use custom stacks.
  # scope "/api", PoeticWeb do
  #   pipe_through :api
  # end
end
