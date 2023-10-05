defmodule HrsmsWeb.EmployeeApiController do
  alias Hrsms.HumanResources
use HrsmsWeb, :controller
  def index(conn,_params) do
    employees = HumanResources.list_employees()
    render(conn,:index,employees: employees)
  end
end
