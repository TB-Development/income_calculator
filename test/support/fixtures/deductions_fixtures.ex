defmodule IncomeCalculator.DeductionsFixtures do
  import IncomeCalculator.PaychecksFixtures
  @moduledoc """
    This module defines test helpers for creating
    entities via the `IncomeCalculator.Deductions` context.
  """

  @doc """
    Generate a deduction.
  """
  def deduction_fixture(attrs \\ %{}) do
    paycheck = %{hours: 40, rate: 21.00, overtime_modifier: 1.5, regular_hour_limit: 40} |> paycheck_fixture()

    {:ok, deduction} =
      attrs
      |> Enum.into(%{amount: 10.00, paycheck_id: paycheck.id})
      |> IncomeCalculator.Deductions.create_deduction()

    deduction
  end
end
