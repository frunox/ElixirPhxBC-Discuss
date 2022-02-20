defmodule Discuss.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    IO.puts("---- Comment changeset comment, attrs")
    IO.inspect comment
    IO.inspect attrs
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
