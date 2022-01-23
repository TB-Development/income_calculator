defmodule IncomeCalculator.PaychecksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IncomeCalculator.Paychecks` context.
  """

  @doc """
  Generate a paycheck.
  """
  def paycheck_fixture(attrs \\ %{}) do
    {:ok, paycheck} =
      attrs
      |> Enum.into(%{})
      |> IncomeCalculator.Paychecks.create_paycheck()

    paycheck
  end
end
