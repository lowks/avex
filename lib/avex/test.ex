defmodule Avex.Test do
  use Avex.Model

  fields :optional, [:number, :expiry_date]
  fields :required, [:test, :holder]

  # update :test, with: :update_test
  # update :test, with: :update_test, args: ["hey"]
  # update :test, do: String.upcase(value)

  validate :test, format: ~r/^(\d{3,4})?$/
  validate :test, included: ["list"]
  validate :test, excluded: ["list"]

  validate :test do
    if is_binary(value) do
      :ok
    else
      {:error, "value is invalid"}
    end
  end

  def update_test(:ok, "hey") do
    "value" <> "hey"
  end

  def update_test(nil) do
    :ok
  end

  def updates do
    @updates
  end

  # def fields do
  #   @optional_fields ++ @required_fields
  # end
end