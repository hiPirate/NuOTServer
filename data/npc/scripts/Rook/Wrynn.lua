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
	{ text = "Food doesn't heal you fast enough? Try a health potion!" },
	{ text = "Remember to turn in your empty vials!" },
	{ text = "Stock up on your potions and antidotes here!" },
	{ text = "Don't be ill prepared. Buy potions before your hunt!" }
}
npcHandler:addModule(VoiceModule:new(voices))

-- Basic Keywords
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm an alchemist. I provide potions and antidotes for everyone."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Wrynn. If you need some potions or antidotes, ask me to {trade}."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "My watch says it's |TIME|."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "If you need potions or antidotes, just ask me for a {trade}."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "Take a look at the blackboard and ask me for a {trade} when you're ready."})
keywordHandler:addAliasKeyword({'offers'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'potions'})
keywordHandler:addAliasKeyword({'antidotes'})

-- Self
keywordHandler:addKeyword({"citizens"}, StdModule.say, {npcHandler = npcHandler, text = "I know {Albin}, {Asbjorn}, {John} and {Ruby}. Who are you wanting information about?"})
keywordHandler:addAliasKeyword({'inhabitants'})
keywordHandler:addKeyword({"Wrynn"}, StdModule.say, {npcHandler = npcHandler, text = "That's me! Interested in a {trade}?"})
keywordHandler:addAliasKeyword({'wrynn'})

-- Other NPCs
keywordHandler:addKeyword({"Albin"}, StdModule.say, {npcHandler = npcHandler, text = "Albin is the temple monk. He can heal you if you're critically injured or poisoned."})
keywordHandler:addAliasKeyword({'albin'})
keywordHandler:addKeyword({"Asbjorn"}, StdModule.say, {npcHandler = npcHandler, text = "Asbjorn runs the blacksmith here in town as well as operates the armors, weapons and shields shop. Stop by his store if you're in need of new gear."})
keywordHandler:addAliasKeyword({'asbjorn'})
keywordHandler:addKeyword({"John"}, StdModule.say, {npcHandler = npcHandler, text = "John used to help {Albin} at the temple, but he had some issues with alcohol, which is forbidden. Now he roams the city, homeless."})
keywordHandler:addAliasKeyword({'john'})
keywordHandler:addKeyword({"Ruby"}, StdModule.say, {npcHandler = npcHandler, text = "In Ruby's General Store you'll find necessary equipment and tools for your travels."})
keywordHandler:addAliasKeyword({'ruby'})

npcHandler:setMessage(MESSAGE_WALKAWAY, "Is it so hard to say bye?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, and safe travels!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Alright! Here's what I have in stock.")
npcHandler:setMessage(MESSAGE_GREET, "Hi there, |PLAYERNAME|! Welcome to my alchemist lab. If you need any potions or antidotes, just ask me to {trade}!")

npcHandler:addModule(FocusModule:new())
