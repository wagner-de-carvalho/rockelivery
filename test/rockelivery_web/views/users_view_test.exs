defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase
  alias RockeliveryWeb.UsersView
  alias Rockelivery.User
  import Phoenix.View
  import Rockelivery.Factory

  describe "render/2" do
    test "renders create.json" do
      user = build(:user)
      response = render(UsersView, "create.json", user: user)

      assert(
        %{
          message: "User created!",
          user: %User{
            address: "Rua ABC",
            age: 30,
            cep: "29160100",
            cpf: "00100200300",
            email: "fulano@mail.com",
            id: "7d412f02-e3cc-4603-8ce3-d431fe888401",
            inserted_at: nil,
            name: "Fulano",
            password: "1234567",
            password_hash: nil,
            updated_at: nil
          }
        } = response
      )
    end
  end
end