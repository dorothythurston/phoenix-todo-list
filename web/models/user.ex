defmodule PhoenixTodoList.User do
  use PhoenixTodoList.Web, :model
  alias PhoenixTodoList.Password

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_digest, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps
  end

  @required_fields ~w(name email password password_confirmation)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email, on: PhoenixTodoList.Repo, downcase: true)
    |> validate_length(:password, min: 1)
    |> validate_length(:password_confirmation, min: 1)
    |> validate_confirmation(:password, message: "passwords do not match")
    |> hash_password
  end

  defp hash_password(changeset) do
    Password.encrypt(changeset)
  end
end
