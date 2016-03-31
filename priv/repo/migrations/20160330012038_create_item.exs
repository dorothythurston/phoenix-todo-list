defmodule PhoenixTodoList.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :content, :text
      add :list_id, references(:lists, on_delete: :delete_all), null: false

      timestamps
    end
    create index(:items, [:list_id])

  end
end
