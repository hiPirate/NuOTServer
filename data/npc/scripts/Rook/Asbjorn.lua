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
	{ text = "Need a new piece of armor? Come on in!" },
	{ text = "Don't forget to grab a shield!" },
	{ text = "I buy and sell various armors, weapons and shields!" },
	{ text = "Finest weapons and armors for miles!" }
}
npcHandler:addModule(VoiceModule:new(voices))

-- Basic Keywords
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm a blacksmith and operate my weapons and armor shop."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Asbjorn. Are you looking to {trade} armors, weapons or perhaps shields?"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Right now it's |TIME|."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "If you want to buy or sell armors, weapons or shields, just ask me for a {trade}."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "Take a look at the blackboard and ask me for a {trade} when you're ready."})
keywordHandler:addAliasKeyword({'offers'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'armors'})
keywordHandler:addAliasKeyword({'weapons'})
keywordHandler:addAliasKeyword({'shields'})

-- Self
keywordHandler:addKeyword({"citizens"}, StdModule.say, {npcHandler = npcHandler, text = "I know {Albin}, {John}, {Ruby} and {Wrynn}. Who are you wanting information about?"})
keywordHandler:addAliasKeyword({'inhabitants'})
keywordHandler:addKeyword({"Asbjorn"}, StdModule.say, {npcHandler = npcHandler, text = "That's me. Are you looking to {trade} for some new gear?"})
keywordHandler:addAliasKeyword({'asbjorn'})

-- Other NPCs
keywordHandler:addKeyword({"Albin"}, StdModule.say, {npcHandler = npcHandler, text = "Albin is the temple monk. He can heal you if you're critically injured or poisoned."})
keywordHandler:addAliasKeyword({'albin'})
keywordHandler:addKeyword({"John"}, StdModule.say, {npcHandler = npcHandler, text = "John used to help {Albin} at the temple, but he had some issues with alcohol, which is forbidden. Now he roams the city, homeless."})
keywordHandler:addAliasKeyword({'john'})
keywordHandler:addKeyword({"Ruby"}, StdModule.say, {npcHandler = npcHandler, text = "In Ruby's General Store you'll find necessary equipment and tools for your travels."})
keywordHandler:addAliasKeyword({'ruby'})
keywordHandler:addKeyword({"Wrynn"}, StdModule.say, {npcHandler = npcHandler, text = "Wrynn runs the alchemist lab in the Mage's Sector of the Temple. She sells potions and antidotes."})
keywordHandler:addAliasKeyword({'wrynn'})

npcHandler:setMessage(MESSAGE_WALKAWAY, "Hmpfh. Bye then.")
npcHandler:setMessage(MESSAGE_FAREWELL, "So long, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Absolutely. Here's what I have to offer.")
npcHandler:setMessage(MESSAGE_GREET, {"Welcome to my smith, |PLAYERNAME|! Are you looking to {trade} for new armors, weapons or shields?"})

npcHandler:addModule(FocusModule:new())
