defmodule IncomeCalculator.PaychecksTest do
  use IncomeCalculator.DataCase
  alias IncomeCalculator.Paychecks

  describe "paychecks" do
    alias IncomeCalculator.Paychecks.Paycheck
    import IncomeCalculator.PaychecksFixtures

    @valid_attrs %{hours: 40, rate: 21.00, overtime_modifier: 1.5, regular_hour_limit: 40}
    @invalid_attrs %{hours: "invalid", rate: "invalid", overtime_modifier: "invalid", regular_hour_limit: "invalid"}

    test "list_paychecks/0 returns all paychecks" do
      paycheck = @valid_attrs |> paycheck_fixture()
      assert Paychecks.list_paychecks() == [paycheck]
    end

    test "get_paycheck!/1 returns the paycheck with given id" do
      paycheck = @valid_attrs |> paycheck_fixture()
      assert Paychecks.get_paycheck!(paycheck.id) == paycheck
    end

    test "create_paycheck/1 with valid data creates a paycheck" do
      assert {:ok, %Paycheck{} = _paycheck} = Paychecks.create_paycheck(@valid_attrs)
    end

    test "create_paycheck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Paychecks.create_paycheck(@invalid_attrs)
    end

    test "update_paycheck/2 with valid data updates the paycheck" do
      paycheck = @valid_attrs |> paycheck_fixture()
      update_attrs = %{amount: 1}

      assert {:ok, %Paycheck{} = _paycheck} = Paychecks.update_paycheck(paycheck, update_attrs)
    end

    test "update_paycheck/2 with invalid data returns error changeset" do
      paycheck = @valid_attrs |> paycheck_fixture()
      assert {:error, %Ecto.Changeset{}} = Paychecks.update_paycheck(paycheck, @invalid_attrs)
      assert paycheck == Paychecks.get_paycheck!(paycheck.id)
    end

    test "delete_paycheck/1 deletes the paycheck" do
      paycheck = @valid_attrs |> paycheck_fixture()
      assert {:ok, %Paycheck{}} = Paychecks.delete_paycheck(paycheck)
      assert_raise Ecto.NoResultsError, fn -> Paychecks.get_paycheck!(paycheck.id) end
    end

    test "change_paycheck/1 returns a paycheck changeset" do
      paycheck = @valid_attrs |> paycheck_fixture()
      assert %Ecto.Changeset{} = Paychecks.change_paycheck(paycheck)
    end

  end
end
