defmodule ActorTest do

  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}"}
        greet
    end
  end

end

pid = spawn(ActorTest, :greet, [])
send pid, {self, "World!"}
receive do
  {:ok, msg} -> IO.puts msg
after 500 ->
  IO.puts "Actor is dead"
end
