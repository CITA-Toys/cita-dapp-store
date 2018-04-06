defmodule CitaDappStoreWeb.Router do
  use CitaDappStoreWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", CitaDappStoreWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController)
    resources("/dapps", DappController)
    resources("/chains", ChainController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", CitaDappStoreWeb do
  #   pipe_through :api
  # end
end
