Config = {}

Config.Trigger = 'esx:getSharedObject'

Config.ComecarTrabalho = { -- blip começar
    vec3(1196.73,-3261.92,5.5)
}
Config.EntregarTrabalho = { -- blip entregar
    vec3(1222.84,-3289.98,5.5)
}
Config.Locations = {
    ["trocarRoupa"] = {  -- Blip de vestir a roupa
        label = "Troca de Roupa",
        coords = {x = 1201.41, y = -3263.44, z = 5.5, h = 270.1}, 
    },
}

Config.BlipRoupa  = false  --  Se estiver "true" a pessoa será obrigada a vestir a farda do trabalho senão não será!



-- Mensagens blips/notificações/progressbar - Client

Config.Mensagem1 = 'Pressione ~INPUT_CONTEXT~ para pegar Caixa'

Config.Mensagem2 = 'Pressione ~INPUT_CONTEXT~ para jogar a Caixa'

Config.Progressbar1 = 'A separar os resíduos...'

Config.Not1 = 'Caixa entregada com sucesso'


-- Itens - Server 

Config.NumeroItens = 5  --  Numero maximo 5 | Para mais informações contacte o zcmg ou kiko!

Config.Item1 = 'bread'
Config.Item2 = 'iron'
Config.Item3 = 'bread'
Config.Item4 = 'bread'
Config.Item5 = 'bread'

Config.Quantidade_Item1 = math.random(1,5)
Config.Quantidade_Item2 = math.random(1,5)
Config.Quantidade_Item3 = math.random(1,5)
Config.Quantidade_Item4 = math.random(1,5)
Config.Quantidade_Item5 = math.random(1,5)





-- Cor dos Blips de vestir a roupa
Config.corBlips = { 
    ["blip"] = {
        x = 0, --r
        y = 255, --g
        z = 0 --b
    }
}

-- Farda de trabalho
Config.Uniforms = {
	cloakroom = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 89,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 36,   ['pants_2'] = 0,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 5,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 34,  ['tshirt_2'] = 0,
			['torso_1'] = 59,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 38,   ['pants_2'] = 0,
			['shoes_1'] = 68,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},

}

-- Criado por KIKO e zcmg
-- Discord Fredyzaooo#4702 e https://discord.com/invite/Qt5WraEMxf
