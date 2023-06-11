defmodule TiktokenTest do
  use ExUnit.Case
  doctest Tiktoken

  test "get model" do
    assert Tiktoken.CL100K == Tiktoken.encoding_for_model("gpt-3.5-turbo")
    assert Tiktoken.R50K == Tiktoken.encoding_for_model("text-curie-001")
    assert Tiktoken.P50KEdit == Tiktoken.encoding_for_model("text-davinci-edit-001")
    assert Tiktoken.P50K == Tiktoken.encoding_for_model("code-davinci-002")
  end

  test "encode/decode" do
    {:ok, tokens} = Tiktoken.CL100K.encode_with_special_tokens("Hello world!")
    assert tokens == [9906, 1917, 0]
    assert {:ok, "Hello world!"} = Tiktoken.CL100K.decode(tokens)
  end
end
