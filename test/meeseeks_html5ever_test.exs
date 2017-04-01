defmodule MeeseeksHtml5everTest do
  use ExUnit.Case
  doctest MeeseeksHtml5ever

  test "parse basic html" do
    html = "<html><head></head><body><random:div>Hi</div></body></html>"
    ret = {:ok, [{"html", [], [{"head", [], []}, {"body", [], [{"random:div", [], []}]}]}]}
    assert MeeseeksHtml5ever.parse(html) == ret
  end

  test "unbalanced worst case" do
    html = String.duplicate("<div>", 100)
    assert match?({:ok, _}, MeeseeksHtml5ever.parse(html))
  end

end
