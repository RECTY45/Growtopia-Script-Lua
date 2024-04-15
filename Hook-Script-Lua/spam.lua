SPAM_MESSAGE = "Subscribe Enrico Imanuella"

while true do
sendPacket(false, "action|input\n|text|"..SPAM_MESSAGE,2 )
sleep(6000)
end
