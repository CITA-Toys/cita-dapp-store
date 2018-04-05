defmodule CitaDappStoreWeb.PageController do
  use CitaDappStoreWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
