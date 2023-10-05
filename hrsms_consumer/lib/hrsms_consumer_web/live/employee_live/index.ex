defmodule HrsmsConsumerWeb.EmployeeLive.Index do
  use HrsmsConsumerWeb, :live_view
  alias HrsmsConsumer.HumanResources


  @impl true
  def mount(_params, _session, socket) do
    {:ok,stream(socket,:employees,HumanResources.list_employees())}
  end
end
