defmodule Microblog.Blog.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Follow


  schema "follows" do
    belongs_to :follower, Microblog.Blog.User
    belongs_to :following, Microblog.Blog.User


    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:follower_id, :following_id])
    |> validate_required([:follower_id, :following_id])
  end
end
