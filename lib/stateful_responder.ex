defmodule StatefulResponder do
  # The "\\ 0" part is the mechanism for setting a default value of 0.
  def responder(num_calls \\ 0) do
    receive do
      :hello ->
        IO.puts "Hi there!"
        responder(num_calls + 1)
      :identify ->
        IO.puts "I'm a stateful responder that has been called #{num_calls + 1} times."
        responder(num_calls + 1)
      :goodbye ->
        IO.puts "I suppose #{num_calls + 1} messages is good enough. Adios!"
    end
  end
end