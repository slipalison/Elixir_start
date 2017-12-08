defmodule  DiscussWeb.TopicController do
    use DiscussWeb, :controller

    alias Discuss.Topic

    def new(conn, params) do
        #IO.puts "+++++"
        #IO.inspect conn
        #IO.puts "+++++"
        #IO.inspect params
        #IO.puts "+++++"
        changeset = Topic.changeset(%Topic{}, %{})
        render conn, "new.html", changeset: changeset
    end

end