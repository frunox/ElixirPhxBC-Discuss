defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  import Ecto

  alias Phoenix.Socket.Serializer
  alias Discuss.{Topic, Comment}

  @impl true
  def join("comments:" <> topic_id, payload, socket) do
    if authorized?(payload) do
      topic_id = String.to_integer(topic_id)
      topic = Repo.get(Topic, topic_id)
      # IO.puts("+++++++++ topic")
      # IO.inspect(topic)
      {:ok, %{}, assign(socket, :topic, topic)}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # V134 handle_in for adding new comment ('comment:add')
  def handle_in("comment:add", %{"content" => content}, socket) do
    topic = socket.assigns.topic
 
    changeset = topic
    |> build_assoc(:comments)
    |> Comment.changeset(%{content: content})

    case Repo.insert(changeset) do
      {:ok, comment} ->
        {:reply, :ok, socket}
      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end

    # {:reply, {:ok, content}, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    IO.puts("+++++++++++ in 'ping'")
    IO.inspect(payload)
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (comments:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
