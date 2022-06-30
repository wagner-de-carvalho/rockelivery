defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true
  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create
  alias Rockelivery.ViaCep.ClientMock
  import Mox
  import Rockelivery.Factory

  describe "call/1" do
    test "when all params are valid, creates a user" do
      params = build(:user_string_params)

      # // biblioteca mox
      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response = Create.call(params)
      assert {:ok, %User{}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_string_params, %{"password" => "123", "age" => 16})
      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{result: changeset, status: :bad_request}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
