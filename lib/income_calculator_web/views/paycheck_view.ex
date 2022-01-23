defmodule IncomeCalculatorWeb.PaycheckView do
  use IncomeCalculatorWeb, :view

  alias IncomeCalculator.{Paychecks}

  def headers() do
    [
      "Hours",
      "Rate",
      "Gross Income",
      "Net Income"
    ]
  end

  def gross_income(paycheck) do
    Paychecks.gross_income(paycheck)
  end

  def net_income(paycheck) do
    Paychecks.net_income(paycheck)
  end
end
