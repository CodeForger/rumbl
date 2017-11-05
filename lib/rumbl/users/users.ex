defmodule Rumbl.Users do
  import Ecto.Query, warn: false
  alias Rumbl.Repo

  alias Rumbl.Users.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by(params), do: Repo.get_by(User, params)

end
