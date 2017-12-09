defmodule DiscussWeb.AuthController do
    use DiscussWeb, :controller
    plug Ueberauth
    alias Discuss.Repo
    alias Discuss.User
    
    def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
       # IO.puts "++++++++"
       # IO.inspect(conn.assigns)
       # IO.puts "++++++++"
       # IO.inspect params
       # IO.puts "++++++++"

       user_params = %{token: auth.credentials.token, email: auth.info.email, provider: auth.info.image} 
       changeset = User.changeset(%User{}, user_params) 

       signin(conn, changeset)

    end

    defp signin(conn, changeset) do
       case insert_or_update_user(changeset) do
           {:ok, user} -> 
                conn
                |> put_flash(:info, "Bem vindo #{user.email}")
                |> put_session(:user_id, user.id)
                |> redirect(to: topic_path(conn, :index))
           {:error, _reason} ->
                conn
                |> put_flash(:error, "Erro ao logar")
                |> redirect(to: topic_path(conn, :index))

       end
    end
    
    defp insert_or_update_user(changeset) do
        case Repo.get_by(User, email: changeset.changes.email) do
            nil -> 
                Repo.insert(changeset)
            user -> 
                {:ok, user}
        end

    end

end