defmodule HrsmsWeb.EmployeeApiJSON do
  def index(%{employees: employees}) do
    %{data:
        for(employee <- employees) do
          %{id: employee.id,
            employee_id: employee.emp,
          last: employee.last_name,
          first: employee.first_name,
          date_of_hire: employee.date_of_hire,
          department: employee.department
          }
        end
    }
  end
 end
