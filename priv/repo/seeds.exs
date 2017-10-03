# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo

alias Microblog.Blog.User
Repo.delete_all(User)
thom = Repo.insert!(%User{username: "thom"})
oom = Repo.insert!(%User{username: "oom"})

alias Microblog.Blog.Post
Repo.delete_all(Post)
thom_post = Repo.insert!(%Post{content: "TAke a look, y'all: IMG_4346.jpeg", user_id: thom.id})
oom_post = Repo.insert!(%Post{content: "Force", user_id: oom.id})

alias Microblog.Blog.Follow
Repo.delete_all(Follow)
thom_follow = Repo.insert!(%Follow{follower_id: thom.id, following_id: oom.id})