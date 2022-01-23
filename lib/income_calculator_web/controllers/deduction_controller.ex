defmodule IncomeCalculatorWeb.DeductionController do
  use IncomeCalculatorWeb, :controller

  alias IncomeCalculator.Deductions
  alias IncomeCalculator.Deductions.Deduction

  def index(conn, _params) do
    deductions = Deductions.list_deductions()
    render(conn, "index.html", deductions: deductions)
  end

  def new(conn, _params) do
    changeset = Deductions.change_deduction(%Deduction{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deduction" => deduction_params}) do
    case Deductions.create_deduction(deduction_params) do
      {:ok, deduction} ->
        conn
        |> put_flash(:info, "Deduction created successfully.")
        |> redirect(to: Routes.deduction_path(conn, :show, deduction))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deduction = Deductions.get_deduction!(id)
    render(conn, "show.html", deduction: deduction)
  end

  def edit(conn, %{"id" => id}) do
    deduction = Deductions.get_deduction!(id)
    changeset = Deductions.change_deduction(deduction)
    render(conn, "edit.html", deduction: deduction, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deduction" => deduction_params}) do
    deduction = Deductions.get_deduction!(id)

    case Deductions.update_deduction(deduction, deduction_params) do
      {:ok, deduction} ->
        conn
        |> put_flash(:info, "Deduction updated successfully.")
        |> redirect(to: Routes.deduction_path(conn, :show, deduction))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", deduction: deduction, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deduction = Deductions.get_deduction!(id)
    {:ok, _deduction} = Deductions.delete_deduction(deduction)

    conn
    |> put_flash(:info, "Deduction deleted successfully.")
    |> redirect(to: Routes.deduction_path(conn, :index))
  end
end
