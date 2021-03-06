defmodule Rockelivery.Error do
  @keys [:status, :result]
  @enforce_keys @keys
  defstruct @keys

  def build(status, result) do
    %__MODULE__{status: status, result: result}
  end

  def build_user_not_found_error, do: build(:bad_request, "User not found")
end
