defmodule Microblog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Post


  schema "posts" do
    field :content, :string
    field :timestamp, :naive_datetime

    belongs_to :user, Microblog.Blog.User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:timestamp, :content, :user_id])
    |> validate_required([:timestamp, :content, :user_id])
  end
end
