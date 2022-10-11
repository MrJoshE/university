defmodule Main do
  IO.puts("Hello world!")
  inp = IO.gets("Please enter something")
  String.trim(inp)
  name = "Josh Everett"
  IO.puts("Hello #{name}! 2 + 2 is #{2 + 2}")
  IO.puts("hello, " <> name <> "!")
  IO.puts(~s{"Hello", } <> name <> "!")

end
