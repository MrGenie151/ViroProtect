local toolbar = plugin:CreateToolbar("ViroProtect")
local mainButton = toolbar:CreateButton("Scan Game", "Scans the game, and looks out for viruses.","rbxassetid://23447020")
local scriptTriggerNames = {"Spread","Vaccine","Webhook","4d being","loser","infected","rolf","wildfire","geometry","join teh moovement","guest talker","anti-lag","snap infection","numbrez","imahakwtfz","wtfzor","d��������������ng.........you got owned...","vivrus","zomg saved","hello...i �m your new lord lolz","worm","no samurai plzzz","ohai","virus","guest_talking_script","snapreducer","snap-reducer","script.....or..is.it","timer","datacontrollers","chaotic","teleportscript","spreadify","antivirussoftware","ropack injection","2_2_1_1_s_s_","safity lock","ropack","ropack backup","no availiblitly lock","protection","whfcjgysa","073dea7p","Infect","rofl","notorsoitis","numberitis","Virus","4dbeing","4d being","loser","infected","no samurai plzzz","ohai","virus","guest_talking_script","snapreducer","snap-reducer","script.....or..is.it","Script......Or is it...","rolf","wildfire","geometry","join teh moovement","guest talker","anti-lag","snap infection","numbrez","imahakwtfz","wtfzor","d��������������ng.........you got owned...","vivrus","zomg saved","hello...i �m your new lord lolz","worm","timer","datacontrollers","chaotic","spreadify","antivirussoftware","ropack injection","2_2_1_1_s_s_","safity lock","ropack","ropack backup","no availiblitly lock","protection","whfcjgysa","073dea7p","PWNZ0R3D","CompassEffect" , "Guest_Talking_Script" , "cubiclemon rulz","Motivation","motivation" , "Anti-Lag" , "troll" , "Troll" , "D�������NG YOU GOT OWNED AND PWNED" , "Vaccine","Yeller" , "super virus script","BEST ANTILAG EVER", "Infection","N0ISE","annoyingscript","lag virus","RSFacility","noitcefnI","PWNScript","EXTREMELY ANNOYING VIRUS","skull8889","20dayton","�9001","9001","�","OH SNAP YOU GOT INFECTED!","friendly virus script","lagscript","lag script","N0ISESCRIPT","N0ISE SCRIPT","LAG","spread virus","Spread","OwO PILLA VIRUS OwO","1","extremelyannoyingscript","yougotinfected","vivirus","snap virus","suriV","Anti-Lag","super antivirus","Super infection","1337leetvirus","Yummey!","Chil-Virus","AHAHAHAHA","OwO virus","IgnoreThisModel","GET INFECTED NOOB","DELETE ME!","Troll script","Troll Script","chaotic script","OMEGA VIRUS","lag virus","AntiLag","1337","LEET VIRUS","1337 LEET!","1337 LEET!!","1337 LEET!!!","worm script","Dont worry im a friendly virus","vivivrus","Nomnomnom1","Nomnomnom1 will hack you too!","LAG!!!","Lag reducer","Snap remover","Anti-snap","vivivirus","Extreme virus script","EXTREME VIRUS SCRIPT","lag and annoying script","LOLWUT","LOLWUT?","LOLWUT???","ProperGr�mmerNeededInPhilosiphalLocations;insertNoobHere","ISt�rtHere","norn virus","crappy norn virus","Wormed","HAAXEDBYCREATURES","HAXXEDBYCREATURES","DEATH TO DATGUY","samsolowalker","OMG LOOK WHAT YOU DID!","Error! Core Overheat: Burning.......you gow owned...","Lololoollllolololololol cant remove this!!","infectedscript","VirusScript","8474�����������259294237492857295837958257239832759832759735928376925723098572","311���������������","�����lololol�������","f��������������������������","0ijouojo","fhfhfhfhv�","Best Antilag ever!!!!","InfectedScript","Infectedscript","Infected_script","Infected_Script","Wildfire","yesman232","FeelFreeToIns3rtGramm�tic�lErrorsHere","WOMP WOMP INFECTED","mean774","1","wormed","leandroMP","Duplicate"}
local scriptSourceTriggers = {"getfenv","PSU","Spread","obfuscated"}
local scriptSourceDeletionTriggers = {"HAX","HAAXX","lOoOoOoOp"}
local placesToScan = {workspace,game.StarterGui,game.ServerScriptService,game.ReplicatedStorage,game.ReplicatedFirst,game.StarterPlayer,game.StarterPack,game.ServerStorage,game.Lighting}
local historyService = game:GetService("ChangeHistoryService")

local function findFirstModel(thing)
	local anc = thing:FindFirstAncestorOfClass("Model")
	local posAnc = workspace:FindFirstAncestorOfClass("Model")
	if posAnc and posAnc.Name ~= "Workspace" then
		anc = findFirstModel(anc)
	end
	return anc
end

local function mainFunc()
	local isVirus = false
	local virusesFound = 0
	local susScripts = {}
	print("Beginning Scan!")
	for _, z in pairs(placesToScan) do
		for i, object in pairs(z:GetDescendants()) do
			isVirus = false
			if object then
				if object:IsA("Script") then
					for p,v in pairs(scriptTriggerNames) do
						if string.match(object.Name,v) then
							object:Destroy()
							isVirus = true
						end
					end
					for _,v in pairs(scriptSourceTriggers) do
						if string.match(object.Source,v) then
							--local anc = object:FindFirstAncestorofClass("Model")
							table.insert(susScripts,object:GetFullName())
						end
					end
					for _,aba in pairs(scriptSourceDeletionTriggers) do
						if string.match(object.Source,aba) then
							object:Destroy()
							isVirus = true
						end
					end
				elseif object:IsA("RotateP") then
					for _,bba in pairs(scriptTriggerNames) do
						if string.match(object.Name,bba) or object.Name == "" then
							object:Destroy()
							isVirus = true
						end
					end
				end
				print("Scanning ".. object.Name)
				if isVirus then
					print("Virus Found! The virus was: ".. object.Name)
					virusesFound += 1
				end
			end
			wait()
		end
	end
	print("Scan Complete! There where ".. virusesFound.." viruses found!")
	if #susScripts > 0 then
		print("These models has some scripts with suspicous code... ")
		for _, c in pairs(susScripts) do
			print(c)
		end
	end
	historyService:SetWaypoint("Game Scanned")
end

mainButton.Click:Connect(mainFunc)
