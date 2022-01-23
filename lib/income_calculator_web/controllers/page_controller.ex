defmodule IncomeCalculatorWeb.PageController do
  use IncomeCalculatorWeb, :controller

  alias IncomeCalculator.{Paychecks, Paychecks.Paycheck}

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
