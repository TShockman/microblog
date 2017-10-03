# Session Controller module adapted from Nat Tuck's NuMartWeb
# application https://github.com/NatTuck/nu_mart/blob/prep-1002/lib/nu_mart_web/controllers/session_controller.ex

defmodule MicroblogWeb.SessionController do
  use MicroblogWeb, :controller

  alias Microblog.Blog

  def login(conn, %{"username" => username}) do
    user = Blog.get_user_by_username(username)

    if user do

      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.username}")
      |> redirect(to: user_path(conn, :index))
    else
      conn
      |> put_session(:user_id, nil)
      |> put_flash(:error, "No such user")
      |> redirect(to: user_path(conn, :index))
    end
  end

  def logout(conn, _args) do
    conn
    |> put_session(:user_id, nil)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: user_path(conn, :index))
  end
end