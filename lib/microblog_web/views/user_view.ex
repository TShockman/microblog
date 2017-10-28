defmodule MicroblogWeb.UserView do
  use MicroblogWeb, :view

  import Ecto.Query

  alias Microblog.Repo
  alias Microblog.Blog.Post
  alias Microblog.Blog.Follow
  alias Microblog.Blog.User

  def list_posts(user) do
  	Repo.all(from p in Post, where: p.user_id == ^user.id, preload: :user)
  end

  def list_followers(user) do
    Repo.all(from f in Follow, where: f.following_id == ^user.id, preload: [:following, :follower])
  end

  def list_following(user) do
    Repo.all(from f in Follow, where: f.follower_id == ^user.id, preload: [:following, :follower])
  end

  def list_feed_posts(user) do
    
  	following_ids = Repo.all(from u in User, join: f in Follow, where: f.follower_id == ^user.id and u.id != ^user.id, select: u.id)

  	Repo.all(from p in Post, where: p.user_id in ^following_ids) |> Repo.preload(:user)
  end

end
