defmodule Microblog.Blog.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Follow


  schema "follows" do
    belongs_to :following, Microblog.Blog.User
    belongs_to :follower, Microblog.Blog.User


    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:following_id, :follower_id])
    |> validate_required([:following_id, :follower_id])
  end
end
