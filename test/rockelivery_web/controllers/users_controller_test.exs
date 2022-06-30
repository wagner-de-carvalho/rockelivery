defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true
  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      params = build(:user_string_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => _address,
                 "age" => 30,
                 "cpf" => "00100200300",
                 "email" => "fulano@mail.com",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = build(:user_string_params, %{"password" => "123", "name" => ""})

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "name" => ["can't be blank"],
          "password" => ["should be at least 6 character(s)"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "7d412f02-e3cc-4603-8ce3-d431fe888401"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
