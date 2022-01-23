defmodule IncomeCalculatorWeb.PageController do
  use IncomeCalculatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
