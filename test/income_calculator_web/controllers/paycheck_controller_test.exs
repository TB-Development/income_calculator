#defmodule IncomeCalculatorWeb.PaycheckControllerTest do
#  use IncomeCalculatorWeb.ConnCase
#
#  import IncomeCalculator.PaychecksFixtures
#
#  @create_attrs %{}
#  @update_attrs %{}
#  @invalid_attrs %{}
#
#  describe "index" do
#    test "lists all paychecks", %{conn: conn} do
#      conn = get(conn, Routes.paycheck_path(conn, :index))
#      assert html_response(conn, 200) =~ "Listing Paychecks"
#    end
#  end
#
#  describe "new paycheck" do
#    test "renders form", %{conn: conn} do
#      conn = get(conn, Routes.paycheck_path(conn, :new))
#      assert html_response(conn, 200) =~ "New Paycheck"
#    end
#  end
#
#  describe "create paycheck" do
#    test "redirects to show when data is valid", %{conn: conn} do
#      conn = post(conn, Routes.paycheck_path(conn, :create), paycheck: @create_attrs)
#
#      assert %{id: id} = redirected_params(conn)
#      assert redirected_to(conn) == Routes.paycheck_path(conn, :show, id)
#
#      conn = get(conn, Routes.paycheck_path(conn, :show, id))
#      assert html_response(conn, 200) =~ "Show Paycheck"
#    end
#
#    test "renders errors when data is invalid", %{conn: conn} do
#      conn = post(conn, Routes.paycheck_path(conn, :create), paycheck: @invalid_attrs)
#      assert html_response(conn, 200) =~ "New Paycheck"
#    end
#  end
#
#  describe "edit paycheck" do
#    setup [:create_paycheck]
#
#    test "renders form for editing chosen paycheck", %{conn: conn, paycheck: paycheck} do
#      conn = get(conn, Routes.paycheck_path(conn, :edit, paycheck))
#      assert html_response(conn, 200) =~ "Edit Paycheck"
#    end
#  end
#
#  describe "update paycheck" do
#    setup [:create_paycheck]
#
#    test "redirects when data is valid", %{conn: conn, paycheck: paycheck} do
#      conn = put(conn, Routes.paycheck_path(conn, :update, paycheck), paycheck: @update_attrs)
#      assert redirected_to(conn) == Routes.paycheck_path(conn, :show, paycheck)
#
#      conn = get(conn, Routes.paycheck_path(conn, :show, paycheck))
#      assert html_response(conn, 200)
#    end
#
#    test "renders errors when data is invalid", %{conn: conn, paycheck: paycheck} do
#      conn = put(conn, Routes.paycheck_path(conn, :update, paycheck), paycheck: @invalid_attrs)
#      assert html_response(conn, 200) =~ "Edit Paycheck"
#    end
#  end
#
#  describe "delete paycheck" do
#    setup [:create_paycheck]
#
#    test "deletes chosen paycheck", %{conn: conn, paycheck: paycheck} do
#      conn = delete(conn, Routes.paycheck_path(conn, :delete, paycheck))
#      assert redirected_to(conn) == Routes.paycheck_path(conn, :index)
#
#      assert_error_sent 404, fn ->
#        get(conn, Routes.paycheck_path(conn, :show, paycheck))
#      end
#    end
#  end
#
#  defp create_paycheck(_) do
#    paycheck = paycheck_fixture()
#    %{paycheck: paycheck}
#  end
#end
