defmodule Microblog.Blog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.User


  schema "users" do
    field :username, :string

    has_many :posts, Microblog.Blog.Post, foreign_key: :user_id

    has_many :followers, Microblog.Blog.Follow, foreign_key: :follower_id
    has_many :following, Microblog.Blog.Follow, foreign_key: :following_id

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username])
    |> validate_required([:username])
  end
end
