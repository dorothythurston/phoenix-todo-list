defmodule PhoenixTodoList.Item do
  use PhoenixTodoList.Web, :model

  schema "items" do
    field :name, :string
    field :content, :string
    belongs_to :list, PhoenixTodoList.List

    timestamps
  end

  @required_fields ~w(name content list_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
