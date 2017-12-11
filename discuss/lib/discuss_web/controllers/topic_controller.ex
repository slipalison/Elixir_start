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
           {:ok, post} -> 
            conn
            |>put_flash(:info, "Topic created")
            |> redirect(to: topic_path(conn, :index))
           {:error, changeset} -> 
            render conn, "new.html", changeset: changeset
       end
    end

    def index(conn, _params) do
        IO.inspect(conn.assigns)
        render conn, "index.html", topics: Repo.all(Topic)
    end

    def edit(conn, %{"id" => topic_id}) do
        topic = Repo.get(Topic, topic_id)
        changeset = Topic.changeset(topic)

        render conn, "edit.html", changeset: changeset , topic: topic
    end
    
    def update(conn, %{"id" => topic_id,  "topic" => topic}) do
        old_topic = Repo.get(Topic, topic_id)
        changeset =  Topic.changeset(old_topic, topic)

        case Repo.update(changeset) do 

            {:ok, _topic} -> 
                conn
                |> put_flash(:info, "Topic update")
                |> redirect(to: topic_path(conn, :index))
            {:error, changeset} -> 
                render conn, "edit.html", changeset: changeset, topic: old_topic
        end

    end

    def delete(conn, %{"id" => topic_id}) do 
    
        Repo.get!(Topic, topic_id) 
        |> Repo.delete!

        conn
        |> put_flash(:info, "Topic deleted")
        |> redirect(to: topic_path(conn, :index))
    
    end

end