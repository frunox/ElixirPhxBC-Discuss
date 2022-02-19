defmodule Discuss.Plugs.SetUser do
    import Plug.Conn
    # import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User

    def init(_opts) do
    end

    def call(conn, _opts) do
        user_id = get_session(conn, :user_id)
        # x = is_nil(uid)
        # user_id = 1
        IO.puts("+++++++ SetUser conn is_nil")
        IO.inspect(is_nil(user_id))

        cond do
            user = user_id && Repo.get(User, user_id) ->
                IO.inspect(user)
                assign(conn, :user, user)
            true ->
                assign(conn, :user, nil)
        end
    end
end
