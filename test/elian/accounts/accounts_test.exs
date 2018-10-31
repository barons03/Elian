defmodule Elian.AccountsTest do
  use Elian.DataCase

  alias Elian.Accounts

  describe "sers" do
    alias Elian.Accounts.User

    @valid_attrs %{activated: true, activated_on: "2010-04-17T14:00:00Z", email: "some email", password: "some password", registered_on: "2010-04-17T14:00:00Z", username: "some username"}
    @update_attrs %{activated: false, activated_on: "2011-05-18T15:01:01Z", email: "some updated email", password: "some updated password", registered_on: "2011-05-18T15:01:01Z", username: "some updated username"}
    @invalid_attrs %{activated: nil, activated_on: nil, email: nil, password: nil, registered_on: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_sers/0 returns all sers" do
      user = user_fixture()
      assert Accounts.list_sers() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.activated == true
      assert user.activated_on == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.registered_on == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)

      
      assert user.activated == false
      assert user.activated_on == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.registered_on == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
