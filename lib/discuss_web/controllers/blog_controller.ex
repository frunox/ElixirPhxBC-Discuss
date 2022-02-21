defmodule DiscussWeb.BlogController do
    use DiscussWeb, :controller

    alias Discuss.Blog

    def index(conn, _params) do
        render(conn, "index.html", posts: Blog.all_posts())
    end

    def show(conn, %{"id" => id}) do
        render(conn, "show.html", post: Blog.get_post_by_id!(id))
    end
end