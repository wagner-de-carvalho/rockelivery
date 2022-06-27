defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 30,
      address: "Rua ABC",
      cep: "29160100",
      cpf: "00100200300",
      email: "fulano@mail.com",
      name: "Fulano",
      password: "1234567"
    }
  end
end
