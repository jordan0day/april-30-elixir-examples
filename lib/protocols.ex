defmodule CoolTypeA do
  defstruct name: "SuperCool Type A", coolness: :super
end

defmodule CoolTypeB do
  defstruct name: "Incredibly Cool Type B", coolness: :off_the_charts
end

# The `Inspect` protocol in Elixir is kind of a corollary to Java or C#'s ".toString()" methods.
defimpl Inspect, for: CoolTypeB do
  def inspect(thing, opts) do
    "This CoolTypeB is named #{thing.name} with a coolness level that is #{thing.coolness}"
  end
end