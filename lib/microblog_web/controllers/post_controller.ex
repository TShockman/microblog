defmodule MicroblogWeb.PostController do
  use MicroblogWeb, :controller

  alias Microblog.Blog
  alias Microblog.Blog.Post

  def index(conn, _params) do
    posts = Blog.list_posts(conn.assigns.current_user.id)
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Blog.change_post(%Post{user_id: conn.assigns.current_user.id})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do    
    case Blog.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: user_post_path(conn, :show, conn.assigns.current_user.id, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Blog.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blog.get_post!(id)

    case Blog.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: user_post_path(conn, :show, conn.assigns.current_user.id, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    {:ok, _post} = Blog.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: user_post_path(conn, :index, conn.assigns.current_user.id))
  end
end
