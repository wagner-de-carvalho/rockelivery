defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true
  alias Ecto.Changeset
  alias Rockelivery.User
  import Rockelivery.Factory

  describe "changeset/2" do
    setup do
      params = build(:user_params)

      {:ok, params: params}
    end

    test "when all params are valid, returns a valid changeset", %{params: params} do
      response = User.changeset(params)
      assert %Changeset{changes: %{name: "Fulano"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with changes", %{params: params} do
      update_params = %{params | name: "Beltrano"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Beltrano"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset", %{params: params} do
      update_params = %{params | age: 16, password: "123"}
      response = User.changeset(update_params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
