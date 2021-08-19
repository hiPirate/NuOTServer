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
	{ text = "Feeling lost? Ask me for help!" },
	{ text = "You can come to me if you need healing or are poisoned!" },
	{ text = "Welcome to the temple!" },
	{ text = "Don't give up, help is right here!" }
}
npcHandler:addModule(VoiceModule:new(voices))

local function greetCallback(cid)
	local player = Player(cid)
	local health = player:getHealth()
	local lowHealth = health < 65
	local poisoned = player:getCondition(CONDITION_POISON)
	if lowHealth or poisoned then
		npcHandler:setMessage(MESSAGE_GREET, "Woah there, |PLAYERNAME|! You are looking quite injured. Let me heal your wounds.")
		if lowHealth then player:addHealth(65 - health) end
		if poisoned then player:removeCondition(CONDITION_POISON) end
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	else
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|! I'll {heal} you if you are injured or poisoned. Feel free to ask me for {help} or about other {citizens}.")
	end
	return true
end

-- Basic keywords
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Albin."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Me? Oh, I'm just a humble {monk}. Ask me if you need {help} or require {healing}."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "The time is |TIME|, my child."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "I can {heal} you if you in need of healing. Also, I can tell you about specific {citizens} if you tell me their name."})

keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = "Woah there, |PLAYERNAME|! You're poisoned, let me cure you of it."},
	function(player) return player:getCondition(CONDITION_POISON) end,
	function(player)
		local health = player:getHealth()
		if health < 65 then player:addHealth(65 - health) end
		player:removeCondition(CONDITION_POISON)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	end
)
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = "Very well, let me heal your wounds."},
	function(player) return player:getHealth() < 185 and player:getHealth() < player:getBaseMaxHealth() end,
	function(player)
		local health = player:getHealth()
		player:addHealth(185 - health)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
)
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = "You don't look too bad, |PLAYERNAME|. My powers can only heal seriously injured citizens. Try eating some food."})

-- Pick quest
local pickKeyword = keywordHandler:addKeyword({'temple key'}, StdModule.say, {npcHandler = npcHandler, text = "You are looking for a new temple key, {yes}?"})
	pickKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = "Here you are! Try not to lose it again.", reset = true},
		function(player) return player:getItemCount(36423) == 0 end,
		function(player)
			player:addItem(36423, 1)
		end
	)
	pickKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = "You already have a {temple key}. Why do you need two?", reset = true})
	pickKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = "Very well, a change of mind.", reset = true})
	pickKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = "I guess you don't need a new {temple key} then.", reset = true})
-- Self
keywordHandler:addKeyword({"citizens"}, StdModule.say, {npcHandler = npcHandler, text = "I know {Asbjorn}, {John}, {Ruby} and {Wrynn}. Who are you wanting information about?"})
keywordHandler:addAliasKeyword({'inhabitants'})
keywordHandler:addKeyword({"Albin"}, StdModule.say, {npcHandler = npcHandler, text = "That's me. Can I {help} you?"})
keywordHandler:addAliasKeyword({'albin'})

-- Other NPCs
keywordHandler:addKeyword({"Asbjorn"}, StdModule.say, {npcHandler = npcHandler, text = "Asbjorn runs the blacksmith here in town as well as operates the armors, weapons and shields shop. Stop by his store if you're in need of new gear."})
keywordHandler:addAliasKeyword({'asbjorn'})
keywordHandler:addKeyword({"John"}, StdModule.say, {npcHandler = npcHandler, text = "John used to help me at the temple, but he had some issues with alcohol, which is forbidden. Now he roams the city, homeless."})
keywordHandler:addAliasKeyword({'john'})
keywordHandler:addKeyword({"Ruby"}, StdModule.say, {npcHandler = npcHandler, text = "In Ruby's General Store you'll find necessary equipment and tools for your travels."})
keywordHandler:addAliasKeyword({'ruby'})
keywordHandler:addKeyword({"Wrynn"}, StdModule.say, {npcHandler = npcHandler, text = "Wrynn runs the alchemist lab in the Mage's Sector of the Temple. She sells potions and antidotes."})
keywordHandler:addAliasKeyword({'wrynn'})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bless you, rude person.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bless you.")
npcHandler:addModule(FocusModule:new())
