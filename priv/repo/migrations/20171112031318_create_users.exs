defmodule Rumbl.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :location, :string
      add :age, :integer

      timestamps()
    end

  end
end
