defmodule IncomeCalculatorWeb.PaycheckController do
  use IncomeCalculatorWeb, :controller

  alias IncomeCalculator.Paychecks
  alias IncomeCalculator.Paychecks.Paycheck

  def index(conn, _params) do
    paychecks = Paychecks.list_paychecks()
    render(conn, "index.html", paychecks: paychecks)
  end

  def new(conn, _params) do
    changeset = Paychecks.change_paycheck(%Paycheck{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"paycheck" => paycheck_params}) do
    case Paychecks.create_paycheck(paycheck_params) do
      {:ok, paycheck} ->
        conn
        |> put_flash(:info, "Paycheck created successfully.")
        |> redirect(to: Routes.paycheck_path(conn, :show, paycheck))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    paycheck = Paychecks.get_paycheck!(id)
    render(conn, "show.html", paycheck: paycheck)
  end

  def edit(conn, %{"id" => id}) do
    paycheck = Paychecks.get_paycheck!(id)
    changeset = Paychecks.change_paycheck(paycheck)
    render(conn, "edit.html", paycheck: paycheck, changeset: changeset)
  end

  def update(conn, %{"id" => id, "paycheck" => paycheck_params}) do
    paycheck = Paychecks.get_paycheck!(id)

    case Paychecks.update_paycheck(paycheck, paycheck_params) do
      {:ok, paycheck} ->
        conn
        |> put_flash(:info, "Paycheck updated successfully.")
        |> redirect(to: Routes.paycheck_path(conn, :show, paycheck))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", paycheck: paycheck, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    paycheck = Paychecks.get_paycheck!(id)
    {:ok, _paycheck} = Paychecks.delete_paycheck(paycheck)

    conn
    |> put_flash(:info, "Paycheck deleted successfully.")
    |> redirect(to: Routes.paycheck_path(conn, :index))
  end
end
