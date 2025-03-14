defmodule TTSMessage do
  def giveMeTheTts() do
    "Hey Doug, I'm worried that our friendship is only parasocial, can you acknowledge this message so that it isn't anymore?"
  end
end

IO.puts TTSMessage.giveMeTheTts()
