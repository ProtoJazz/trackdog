defmodule TrackdogWeb.ResultEntryLive.FormComponent do
  use TrackdogWeb, :live_component

  alias Trackdog.Events

  @impl true
  def update(%{result_entry: result_entry} = assigns, socket) do
    changeset = Events.change_result_entry(result_entry)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"result_entry" => result_entry_params}, socket) do
    changeset =
      socket.assigns.result_entry
      |> Events.change_result_entry(result_entry_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"result_entry" => result_entry_params}, socket) do
    save_result_entry(socket, socket.assigns.action, result_entry_params)
  end

  defp save_result_entry(socket, :edit, result_entry_params) do
    case Events.update_result_entry(socket.assigns.result_entry, result_entry_params) do
      {:ok, _result_entry} ->
        {:noreply,
         socket
         |> put_flash(:info, "Result entry updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_result_entry(socket, :new, result_entry_params) do
    case Events.create_result_entry(result_entry_params) do
      {:ok, _result_entry} ->
        {:noreply,
         socket
         |> put_flash(:info, "Result entry created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
