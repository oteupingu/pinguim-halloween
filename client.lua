local currentDialoguePed, currentHouse = nil, nil
local dialogueActive = false
local cooldowns, tempBlips = {}, {}
local Lang = {}  

---------------------------------------------------------------------
-- 🔹 Carregar idioma
---------------------------------------------------------------------
local function LoadLocale()
    local localePath = ('locales/%s.json'):format(Config.Locale)
    local file = LoadResourceFile(GetCurrentResourceName(), localePath)
    if file then
        Lang = json.decode(file)
        print(("[Halloween] Idioma carregado: %s"):format(Config.Locale))
    else
        print(("[Halloween] ERRO: Arquivo de idioma '%s' não encontrado!"):format(localePath))
    end
end

LoadLocale()

---------------------------------------------------------------------
-- 🔹 Notificação
---------------------------------------------------------------------
local function Notify(title, desc, nType)
    lib.notify({
        title = title or Lang.title or "🎃 Halloween",
        description = desc or "",
        type = nType or "inform"
    })
end

---------------------------------------------------------------------
-- 🔹 Cooldown
---------------------------------------------------------------------
local function IsOnCooldown(houseId)
    local playerId = GetPlayerServerId(PlayerId())
    local playerCooldowns = cooldowns[playerId]
    if not playerCooldowns then return false end

    local expires = playerCooldowns[houseId]
    if expires and expires > GetGameTimer() then
        local timeLeft = math.ceil((expires - GetGameTimer()) / 1000)
        Notify(Lang.title, Lang.notify_wait:format(timeLeft), 'error')
        return true
    end
    return false
end

local function SetCooldown(houseId)
    local playerId = GetPlayerServerId(PlayerId())
    cooldowns[playerId] = cooldowns[playerId] or {}
    cooldowns[playerId][houseId] = GetGameTimer() + (Config.Cooldown * 1000)
end

---------------------------------------------------------------------
-- 🔹 Fecha diálogo e remove NPC
---------------------------------------------------------------------
local function CloseDialogue()
    if currentDialoguePed and DoesEntityExist(currentDialoguePed) then
        DeletePed(currentDialoguePed)
    end
    currentDialoguePed, currentHouse = nil, nil
    dialogueActive = false
end

---------------------------------------------------------------------
-- 🔹 Travessura ou Recompensa
---------------------------------------------------------------------
local function ApplyTrickOrReward()
    local chance = math.random()
    local ped = PlayerPedId()

    if chance < Config.RewardChance then
    -- 🍬 Recompensa
    if currentDialoguePed and DoesEntityExist(currentDialoguePed) then
        local animDict = "mp_common"
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(5) end

        local propModel = `prop_candy_pqs`
        RequestModel(propModel)
        while not HasModelLoaded(propModel) do Wait(5) end
        local prop = CreateObject(propModel, 0, 0, 0, true, true, true)
        AttachEntityToEntity(prop, currentDialoguePed, GetPedBoneIndex(currentDialoguePed, 60309),
            0.1, 0.0, 0.0, 90.0, 0.0, 0.0, true, true, false, true, 1, true)

        TaskPlayAnim(currentDialoguePed, animDict, "givetake1_a", 8.0, -8.0, 2000, 49, 0, false, false, false)
        Wait(1500)
        DeleteObject(prop)
        ClearPedTasks(currentDialoguePed)
        SetModelAsNoLongerNeeded(propModel)
    end

    -- ✉️ Envia pedido para o servidor (será ele que dá o item e notifica)
    TriggerServerEvent('pinguim_halloween:server:GiveReward', 'candy')

    else
        -- 👻 Travessura!
        local trickType = math.random(1, 3)

        if trickType == 1 then
            -- 💫 Efeito bêbado
            ShakeGameplayCam("DRUNK_SHAKE", 1.0)
            SetTimecycleModifier("Drunk")
            SetPedMovementClipset(ped, "move_m@drunk@verydrunk", true)
            lib.notify({ title = Lang.title, description = Lang.drunkz, type = "error" })
            Wait(Config.EffectDuration or 8000)
            ClearTimecycleModifier()
            ResetPedMovementClipset(ped, 0)
            StopGameplayCamShaking(true)
            lib.notify({ title = Lang.title, description = Lang.drunkz, type = "inform" })

    elseif trickType == 2 then

            -- 🐀 Transformar em rato
            local ratModel = `a_c_rat`
            local playerskin = Config.Reloadskin
            local playerId = PlayerId()
            local playerz = GetPlayerServerId(playerId)
            RequestModel(ratModel)
            while not HasModelLoaded(ratModel) do Wait(5) end

            SetPlayerModel(PlayerId(), ratModel)
            SetModelAsNoLongerNeeded(ratModel)
            lib.notify({ title = Lang.title, description = Lang.rat, type = "error" })

            Wait(8000)
            ExecuteCommand("revive " .. playerz)
            ExecuteCommand(playerskin)
            lib.notify({ title = Lang.title, description = Lang.normalz, type = "inform" })

    elseif trickType == 3 then
            -- 💥 Explosão fake
            local coords = GetEntityCoords(ped)
            local playerId = PlayerId() -- pega o ID local do jogador
            local playerz = GetPlayerServerId(playerId) -- converte para o ID do servidor
            AddExplosion(coords.x, coords.y, coords.z, 2, 1.0, true, false, 1.0)
            lib.notify({ title = Lang.title, description = Lang.explosionmortal, type = "error" })

            Wait(10000)
            
            ExecuteCommand("revive " .. playerz)
             
            lib.notify({ title = Lang.title, description = Lang.revive, type = "success" })
        end
    end
end

---------------------------------------------------------------------
-- 🔹 Inicia diálogo com NPC (fecha sempre ao clicar)
---------------------------------------------------------------------
local function StartDialogue(house)
    if currentDialoguePed and DoesEntityExist(currentDialoguePed) then
        DeletePed(currentDialoguePed)
    end

    local model = Config.NPCModels[math.random(#Config.NPCModels)]
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(5) end

    local ped = exports['mt_lib']:createPed({
        x = house.coords.x,
        y = house.coords.y,
        z = house.coords.z,
        w = house.heading
    }, model, { scenario = 'WORLD_HUMAN_STAND_IMPATIENT' })

    SetModelAsNoLongerNeeded(model)
    if not ped then
        Notify(Lang.title, "Erro ao criar NPC", "error")
        return
    end

    currentDialoguePed, currentHouse, dialogueActive = ped, house, true
    cancelAction = CloseDialogue

    local npcName = Lang.npc_names[math.random(#Lang.npc_names)]
    local randomSpeech = Lang.dialogues[math.random(#Lang.dialogues)]

    exports.mt_lib:showDialogue({
        ped = ped,
        label = npcName,
        speech = randomSpeech,
        options = {
            {
                id = 1,
                label = Lang.options.trickortreat,
                icon = 'candy-cane',
                close = true,
                action = function()
                    CreateThread(function()
                        -- Aplica cooldown imediatamente
                        SetCooldown(currentHouse.id, Config.Cooldown or 60)

                        -- Espera o diálogo fechar
                        local attempts = 0
                        Wait(150)
                        while dialogueActive and attempts < 20 do
                            Wait(50)
                            attempts = attempts + 1
                        end

                        -- Fecha o NPC
                        if currentDialoguePed and DoesEntityExist(currentDialoguePed) then
                            DeletePed(currentDialoguePed)
                            currentDialoguePed = nil
                        end
                        dialogueActive = false

                        -- Executa travessura/recompensa
                        ApplyTrickOrReward()
                    end)
                end
            },
            {
                id = 2,
                label = Lang.options.nothing,
                icon = 'ban',
                close = true,
                action = function()
                    -- fechar e retornar; nada mais para correr aqui
                    CreateThread(function()
                        local attempts = 0
                        Wait(30)
                        while dialogueActive and attempts < 10 do
                            Wait(50)
                            attempts = attempts + 1
                        end
                        if currentDialoguePed and DoesEntityExist(currentDialoguePed) then
                            DeletePed(currentDialoguePed)
                            currentDialoguePed = nil
                        end
                        dialogueActive = false
                    end)
                end
            }
        }

    })
end


---------------------------------------------------------------------
-- 🔹 Cria zonas (ox_target)
---------------------------------------------------------------------
CreateThread(function()
    while not exports.ox_target do Wait(250) end
    for i, house in ipairs(Config.Houses) do
        house.id = i
        exports.ox_target:addBoxZone({
            coords = house.coords,
            size = vec3(1.5, 1.5, 2.0),
            rotation = house.heading or 0.0,
            options = {
                {
                    name = ('halloween-house_%d'):format(i),
                    icon = 'fa-solid fa-door-open',
                    label = Lang.options.trickortreat,
                    onSelect = function(data)
                        if IsOnCooldown(house.id) then return end

                        local ped = PlayerPedId() -- o ped do jogador
                        TaskTurnPedToFaceCoord(ped, house.coords.x, house.coords.y, house.coords.z, 1000)
                        Wait(600)

                        local animDict = "timetable@jimmy@doorknock@"
                        RequestAnimDict(animDict)
                        while not HasAnimDictLoaded(animDict) do Wait(5) end

                        TaskPlayAnim(ped, animDict, "knockdoor_idle", 4.0, -4.0, 2500, 0, 0, false, false, false)
                        Wait(2500)
                        ClearPedTasks(ped)

                        StartDialogue(house)
                    end,
                    canInteract = function() return not dialogueActive end,
                    interaction = {
                        type = "progress",
                        duration = 2500,
                        label = Lang.door_knock
                    }
                }
            }
        })
    end
end)

---------------------------------------------------------------------
-- 🔹 Comando /halloween (mostrar blips)
---------------------------------------------------------------------
RegisterCommand("halloween", function()
    Notify(Lang.title, Lang.notify_blips, "success")
    for _, house in ipairs(Config.Houses) do
        local blip = AddBlipForCoord(house.coords.x, house.coords.y, house.coords.z)
        SetBlipSprite(blip, 305)
        SetBlipColour(blip, 47)
        SetBlipScale(blip, 0.8)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Lang.house_name)
        EndTextCommandSetBlipName(blip)
        table.insert(tempBlips, blip)
    end

    print(PlayerPedId)

    CreateThread(function()
        Wait(60000)
        for _, blip in ipairs(tempBlips) do
            if DoesBlipExist(blip) then RemoveBlip(blip) end
        end
        tempBlips = {}
    end)
end)

---------------------------------------------------------------------
-- 🔹 Remove NPC se o jogador se afastar
---------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(1000)
        if dialogueActive and currentDialoguePed and DoesEntityExist(currentDialoguePed) and currentHouse then
            local playerCoords = GetEntityCoords(PlayerPedId())
            if #(playerCoords - currentHouse.coords) > 10.0 then
                CloseDialogue()
                print("[Halloween] NPC removido (jogador afastou-se).")
            end
        end
    end
end)
