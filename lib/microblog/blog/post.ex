defmodule Microblog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Post


  schema "posts" do
    field :content, :string
    field :timestamp, :naive_datetime
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:timestamp, :user, :content])
    |> validate_required([:timestamp, :user, :content])
  end
end
