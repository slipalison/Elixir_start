defmodule  DiscussWeb.TopicController do
    use DiscussWeb, :controller

    alias Discuss.Topic
    alias Discuss.Repo

    def new(conn, _params) do
        #IO.puts "+++++"
        #IO.inspect conn
        #IO.puts "+++++"
        #IO.inspect params
        #IO.puts "+++++"
        changeset = Topic.changeset(%Topic{}, %{})
        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"topic" => topic}) do
       changeset = Topic.changeset(%Topic{}, topic)
       case Repo.insert(changeset) do
           {:ok, post} -> IO.inspect(post)
           {:error, changeset} -> 
            render conn, "new.html", changeset: changeset
       end
    end

    def index(conn, _params) do
        
    end


end