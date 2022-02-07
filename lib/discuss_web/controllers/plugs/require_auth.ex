defmodule Discuss.Plugs.RequireAuth do
  use DiscussWeb, :controller
  import Plug.Conn

  def init(_opts) do
  end

  def call(conn, _opts) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must log in to do this")
      |> redirect(to: Routes.topic_path(conn, :index))
      |> halt()
    end
  end
end
