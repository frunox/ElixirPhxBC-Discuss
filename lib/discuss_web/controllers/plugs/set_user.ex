defmodule Discuss.Plugs.SetUser do
    import Plug.Conn
    # import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User

    def init(_opts) do
    end

    def call(conn, _opts) do
        user_id = get_session(conn, :user_id)
        IO.puts("+++++++ SetUser user_id")
        IO.inspect(user_id)

        cond do
            user = user_id && Repo.get(User, user_id) ->
                assign(conn, :user, user)
            true ->
                assign(conn, :user, nil)
        end
    end
end
