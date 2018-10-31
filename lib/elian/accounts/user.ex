defmodule Elian.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :activated, :boolean, default: false
    field :activated_on, :utc_datetime
    field :email, :string
    field :password, :string
    field :password_unhashed, virtual: true
    field :registered_on, :utc_datetime
    field :username, :string

    timestamps()
  end

  @invalid_email_error "Invalid email"

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password_unhashed, :activated, :registered_on, :activated_on])
    |> validate_required([:username, :email, :password_unhashed])
    |> validate_format(:email, ~r/@/, message: @invalid_email_error)
    |> unique_constraint(:username, message: "Username is taken")
    |> unique_constraint(:email, message: "Email is taken")
    |> validate_length(:password_unhashed, min: 3, max: 512, message: "The length of password should be between 3 and 512 characters")
    |> validate_length(:username, min: 2, max: 128, message: "The length of password should be between 3 and 512 characters")
    |> validate_length(:email, min: 3 ,max: 320, message: "The length of password should be between 3 and 320 characters")
  end

end
