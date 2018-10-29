defmodule ElianWeb.Router do
  use ElianWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElianWeb do
    pipe_through :api
  end
end
