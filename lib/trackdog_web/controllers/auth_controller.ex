defmodule TrackdogWeb.AuthController do
    use TrackdogWeb, :controller
    plug Ueberauth
    alias Trackdog.User
    alias Trackdog.Repo

    def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
        conn
        |> put_flash(:error, "Failed to authenticate.")
        |> redirect(to: "/")
      end

      def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
        user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "google"}
        changeset = User.changeset(%User{}, user_params)

        signin(conn, changeset)
      end

      defp signin(conn, changeset) do
        case insert_or_update_user(changeset) do
            {:ok, user} ->
                conn
                |> put_flash(:info, "Welcome back")
                |> put_session(:user_id, user.id)
                |> redirect(to: "/")
            {:error, _reason} ->
                conn
                |> put_flash(:error, "error signing in")
                |> redirect(to: "/")
        end
    end

    def insert_or_update_user(changeset) do
        case Repo.get_by(User, email: changeset.changes.email) do
            nil ->
              Repo.insert(changeset)
            user ->
              {:ok, user}
            end
    end

end
