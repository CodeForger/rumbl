defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Users

  def index(conn, _params) do
    users = Users.list_users
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render conn, "show.html", user: user
  end
end
