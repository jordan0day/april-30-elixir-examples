defmodule MacroExample do
  # Remember to `require MacroExample` to use this!
  defmacro my_if(condition, clauses) do
    IO.puts "Condition: #{inspect condition}"
    IO.puts "Clauses: #{inspect clauses}"

    quote do
      if unquote(condition), unquote(clauses)
    end
  end
end
