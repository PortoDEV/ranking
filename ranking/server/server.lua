-----------------------------------------------------------------------------------------------------------------------------------------
-- THE CONECTION
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = {}
Tunnel.bindInterface('ranking', src)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVE INITIAL INFOS GROOVE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare('metasG/selectAll', 'SELECT * FROM metas_groove')
vRP._prepare("metasG/rem_command","INSERT FROM metas_groove WHERE id")
vRP.prepare('metasG/selectAll', 'SELECT * FROM metas_groove')
vRP._prepare("metasG/rem_command","INSERT FROM metas_groove WHERE id")
vRP.prepare('metasG/insert', 'INSERT INTO metas_groove(id,nome, meta) VALUES(@id,@nome,@meta)')
vRP.prepare('metasV/insertM', 'INSERT INTO metas_groove(meta) VALUES(@meta)')
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVE INITIAL INFOS GROOVE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare('metasB/selectAll', 'SELECT * FROM metas_ballas')
vRP._prepare("metasB/rem_command","INSERT FROM metas_ballas WHERE id")
vRP.prepare('metasB/selectAll', 'SELECT * FROM metas_ballas')
vRP._prepare("metasB/rem_command","INSERT FROM metas_ballas WHERE id")
vRP.prepare('metasB/insert', 'INSERT INTO metas_ballas(id,nome, meta) VALUES(@id,@nome,@meta)')
vRP.prepare('metasV/insertM', 'INSERT INTO metas_ballas(meta) VALUES(@meta)')
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVE INITIAL INFOS GROOVE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare('metasV/selectAll', 'SELECT * FROM metas_vagos')
vRP._prepare("metasV/rem_command","INSERT FROM metas_vagos WHERE id")
vRP.prepare('metasV/selectAll', 'SELECT * FROM metas_vagos')
vRP._prepare("metasV/rem_command","INSERT FROM metas_vagos WHERE id")
vRP.prepare('metasV/insert', 'INSERT INTO metas_vagos(id,nome, meta) VALUES(@id,@nome,@meta)')
vRP.prepare('metasV/insertM', 'INSERT INTO metas_vagos(id,meta) VALUES(@id,@meta)')
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.returnInfos()
    local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    local dataG = vRP.query('metasG/selectAll',  {  })
    local dataB = vRP.query('metasB/selectAll',  {  })
    local dataV = vRP.query('metasV/selectAll',  {  })
    local userTable = {}

    if user_id then
        if vRP.hasPermission(user_id, 'families.permissao') then
            for k,v in pairs(dataG) do
                userTable[#userTable+1] = {
                    ['id'] = v.id,
                    ['id'] = v.id,
                    ['nome'] = v.nome,
                    ['meta'] = v.meta
                }
            end
            return userTable
        elseif vRP.hasPermission(user_id, 'ballas.permissao') then
            for k,v in pairs(dataB) do
                userTable[#userTable+1] = {
                    ['id'] = v.id,
                    ['id'] = v.id,
                    ['nome'] = v.nome,
                    ['meta'] = v.meta
                }
            end
            return userTable
        elseif vRP.hasPermission(user_id, 'vagos.permissao') then
            for k,v in pairs(dataV) do
                userTable[#userTable+1] = {
                    ['id'] = v.id,
                    ['id'] = v.id,
                    ['nome'] = v.nome,
                    ['meta'] = v.meta
                }
            end
            return userTable
        end
    end
end

function src.checkFac()
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        if vRP.hasPermission(user_id, 'droga.menu') then
            return true
        else
            return false
        end
    end
end