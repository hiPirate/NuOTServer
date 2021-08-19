local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end

local voices = {
	{ text = "Looking for new equipment for your adventure? Come by Ruby's General Store!" },
	{ text = "Don't settle for just one torch, grab two!" },
	{ text = "General equipment and tools at Ruby's General Store!" },
	{ text = "Don't forget your rope when going underground!" }
}
npcHandler:addModule(VoiceModule:new(voices))

-- Basic Keywords
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm the owner of my general store. I sell useful equipment and tools for adventurers."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Ruby. Can I interest you in a {trade}?"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It's about |TIME|. Although, I have no watches to sell right now."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "If you need general equipment, just ask me for a {trade}."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "Take a look at the blackboard and ask me for a {trade} when you're ready."})
keywordHandler:addAliasKeyword({'offers'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'tools'})
keywordHandler:addAliasKeyword({'equipment'})

-- Self
keywordHandler:addKeyword({"citizens"}, StdModule.say, {npcHandler = npcHandler, text = "I know {Albin}, {Asbjorn}, {John} and {Wrynn}. Who are you wanting information about?"})
keywordHandler:addAliasKeyword({'inhabitants'})
keywordHandler:addKeyword({"Ruby"}, StdModule.say, {npcHandler = npcHandler, text = "That's me! Interested in a {trade}?"})
keywordHandler:addAliasKeyword({'ruby'})

-- Other NPCs
keywordHandler:addKeyword({"Albin"}, StdModule.say, {npcHandler = npcHandler, text = "Albin is the temple monk. He can heal you if you're critically injured or poisoned."})
keywordHandler:addAliasKeyword({'albin'})
keywordHandler:addKeyword({"Asbjorn"}, StdModule.say, {npcHandler = npcHandler, text = "Asbjorn runs the blacksmith here in town as well as operates the armors, weapons and shields shop. Stop by his store if you're in need of new gear."})
keywordHandler:addAliasKeyword({'asbjorn'})
keywordHandler:addKeyword({"John"}, StdModule.say, {npcHandler = npcHandler, text = "John used to help {Albin} at the temple, but he had some issues with alcohol, which is forbidden. Now he roams the city, homeless."})
keywordHandler:addAliasKeyword({'john'})
keywordHandler:addKeyword({"Wrynn"}, StdModule.say, {npcHandler = npcHandler, text = "Wrynn runs the alchemist lab in the Mage's Sector of the Temple. She sells potions and antidotes."})
keywordHandler:addAliasKeyword({'wrynn'})

npcHandler:setMessage(MESSAGE_WALKAWAY, "I will never get over rude people.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye, |PLAYERNAME|, come again soon!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Sure, take a look at my wares.")
npcHandler:setMessage(MESSAGE_GREET, "Howdy, |PLAYERNAME|! Welcome to my general store! I'm a specialist for all sorts of tools. Just ask me for a {trade} to see my offers!")

npcHandler:addModule(FocusModule:new())
