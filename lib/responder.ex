defmodule Responder do
  def responder() do
    receive do
      :hello ->
        IO.puts "Hello!"
        responder()
      :identify -> 
        IO.puts "I'm a responder."
        responder()
      :goodbye ->
        IO.puts "Adios!"
    end
  end
end