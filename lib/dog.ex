defmodule Dog do
  defstruct color: nil, bark_type: nil

  def process(dog \\ %Dog{}) do
    receive do
      :color ->
        print_color(dog)
        process(dog)
      :bark_type ->
        print_bark_type(dog)
        process(dog)
      {:color, color} ->
        dog = set_color(dog, color)
        process(dog)
      {:bark_type, bark_type} ->
        dog = set_bark_type(dog, bark_type)
        process(dog)
      {:bark_at_pid, from} when is_pid(from) ->
        if dog.bark_type != nil do
          send(from, {:bark, "The dog #{dog.bark_type}ed at you"})
        end

        process(dog)
    end
  end

  defp print_color(dog) do
    if dog.color == nil do
      IO.puts "No color set"
    else
      IO.puts "The dog is #{dog.color}"
    end
  end

  defp print_bark_type(dog) do
    case dog.bark_type do
      nil -> IO.puts "No bark_type set"
      "meow" -> IO.puts "Are you sure that's a dog?"
      bark -> IO.puts "The dog's bark_type is #{bark}"
    end
  end

  defp set_color(dog, color) do
    Map.put(dog, :color, color)
  end

  defp set_bark_type(dog, bark_type) do
    Map.put(dog, :bark_type, bark_type)
  end
end