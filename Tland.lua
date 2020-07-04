function cmdland(n,c)
  if string.sub(c,1,10) == ".landw set" then
    wm = string.sub(c,12,12)
    dput(n,'wmode',wm)
    dput(n,'welcome',string.sub(c,14,#c))
    sendText(n,'命令执行成功！进入领地提示已更改为:'..string.sub(c,11,#c)..'')
    return -1
  end
  if string.sub(c,1,10) == ".landl set" then
    lm = string.sub(c,12,12)
    dput(n,'lmode',lm)
    dput(n,'le',string.sub(c,14,#c))
    sendText(n,'命令执行成功！离开领地提示已更改为:'..string.sub(c,11,#c)..'')
    return -1
  end
end
Listen("onChat","cmdland")
function inland()
  local players = oList()
  for i=1,#players,1 do
    d = players[i]
    a,b,c = getLand(getPos(players[i]))
    if getLand(getPos(players[i])) == nil then
      if dget(players[i],'in') == 'yes' then
        if dget(d,'le') == nil then
          sendText(players[i],'再见')
          dput(players[i],'in','no')
          else
          if dget(d,'lmode') == nil then
            sendText(players[i],dget(d,'le'))
            dput(players[i],'in','no')
            else
            sendText(players[i],dget(d,'le'),dget(d,'lmode'))
            dput(players[i],'in','no')
          end
        end
      end
      else
      if dget(c[1],'welcome') == nil and dget(players[i],'in') == 'no' then
        sendText(players[i],'§e欢迎来到'..c[1]..'的领地！')
        d = c[1]
        dput(players[i],'in','yes')
        else
        if dget(players[i],'in') == 'no' then
          d = c[1]
          if dget(c[1],'wmode') == nil then
            sendText(players[i],dget(c[1],'welcome'))
            dput(players[i],'in','yes')
            else
            sendText(players[i],dget(c[1],'welcome'),dget(c[1],'wmode'))
            dput(players[i],'in','yes')
           end
        end
      end
    end
  end
end
sbajaj = schedule('inland',1,1)
print('Tland插件已装载！ --作者wzy,有bug加QQ382271046反馈')
function sjk(name)
  dput(name,'in','no')
end
Listen('onJoin','sjk')