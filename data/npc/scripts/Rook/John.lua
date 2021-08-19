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
	{ text = "Does anyone have a gold piece to spare?" },
	{ text = "I will work for food." },
	{ text = "Please, can you spare a gold piece so I can eat?" },
	{ text = "I'm starving!" },
	{ text = "This really sucks." }
}

npcHandler:addModule(VoiceModule:new(voices))

-- Basic Keywords
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I don't have a job."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is John. I'm not special, just an average homeless man."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "I have no idea. I don't own a watch."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "I wish I could help myself."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "I don't have anything to sell."})
keywordHandler:addAliasKeyword({'offers'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'tools'})
keywordHandler:addAliasKeyword({'equipment'})

-- Self
keywordHandler:addKeyword({"citizens"}, StdModule.say, {npcHandler = npcHandler, text = "I know {Albin}, {Asbjorn}, {Ruby} and {Wrynn}. Who are you wanting information about?"})
keywordHandler:addAliasKeyword({'inhabitants'})
keywordHandler:addKeyword({"John"}, StdModule.say, {npcHandler = npcHandler, text = "That's my name."})
keywordHandler:addAliasKeyword({'john'})

-- Other NPCs
keywordHandler:addKeyword({"Albin"}, StdModule.say, {npcHandler = npcHandler, text = "Albin is the temple monk and my previous employer. He can heal you if you're critically injured or poisoned. Just don't drink alcohol around the guy."})
keywordHandler:addAliasKeyword({'albin'})
keywordHandler:addKeyword({"Asbjorn"}, StdModule.say, {npcHandler = npcHandler, text = "Asbjorn runs the blacksmith here in town as well as operates the armors, weapons and shields shop. Stop by his store if you're in need of new gear."})
keywordHandler:addAliasKeyword({'asbjorn'})
keywordHandler:addKeyword({"Ruby"}, StdModule.say, {npcHandler = npcHandler, text = "In Ruby's General Store you'll find necessary equipment and tools for your travels."})
keywordHandler:addAliasKeyword({'ruby'})
keywordHandler:addKeyword({"Wrynn"}, StdModule.say, {npcHandler = npcHandler, text = "Wrynn runs the alchemist lab in the Mage's Sector of the Temple. She sells potions and antidotes."})
keywordHandler:addAliasKeyword({'wrynn'})

npcHandler:setMessage(MESSAGE_WALKAWAY, "I'll take that as goodbye.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Safe travels, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_GREET, "Good day, |PLAYERNAME|. I'm John, the homeless man.")

npcHandler:addModule(FocusModule:new())
