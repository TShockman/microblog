defmodule Microblog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :timestamp, :naive_datetime
      add :user, :string
      add :content, :text

      timestamps()
    end

  end
end
