defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Users
  alias Rumbl.Users.User

  def index(conn, _params) do
    users = Users.list_users
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render conn, "show.html", user: user
  end

  def new(conn, _params) do
    changeset = Users.change_user(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end
