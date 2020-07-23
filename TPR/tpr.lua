local xs,xe = 1,100000 --随机x轴传送范围限制(不要写负数！！！
local ys,ye = 70,80 --随机y轴传送范围限制(不要写负数！！！
local zs,ze = 1,100000 --随机z轴传送范围限制(不要写负数！！！
function nmsl(name,lbw)
  if getLandV(getPos(name)) == nil then
    runCmd('effect '..name..' Regeneration 3 3')
    runCmd('effect '..name..' Blindness 3 3')
    runCmd('execute '..name..' ~~~ fill ~ ~ ~ ~ ~1 ~ air')
  else
    tpr()
  end
end
function tpr()
  local  x = math.random(xs,xe)
  local  y = math.random(ys,ye)
  local  z = math.random(zs,ze)
  local xza = math.random(1,2)
  local xzb = math.random(1,2)
  if xza== 1 then
    yyy = '-'
  else
    yyy = ''
  end
  if xzb== 1 then
    yyyy = '-'
  else
    yyyy = ''
  end
    runCmd('tp '..ln..' '..yyy..''..x..' '..y..' '..yyyy..''..z..'')
    nmsl(ln)
end
function f()
  z6 = getPos(ln)
  if z6 == z5 then
    agauqjq = schedule('tpr',0,1)
    sendText(ln,'§e将在0.5s后传送！移动即可取消传送')
  else
    sendText(ln,'取消传送成功！')
  end
end
function e()
  z5 = getPos(ln)
  if z5 == z4 then
    shjajqlaak = schedule('f',0,2)
    sendText(ln,'§e将在1s后传送！移动即可取消传送')
  else
    sendText(ln,'取消传送成功！')
  end
end
function d()
  z4 = getPos(ln)
  if z4 == z3 then
    aguaiaiq = schedule('e',0,2)
    sendText(ln,'§e将在2s后传送！移动即可取消传送')
  else
    sendText(ln,'取消传送成功！')
  end
end
function c()
  z3 = getPos(ln)
  if z2 == z3 then
    gsuajwiwo = schedule('d',0,2)
    sendText(ln,'§e将在3s后传送！移动即可取消传送')
  else
    sendText(ln,'取消传送成功！')
  end
end
function b()
  z2 = getPos(ln)
  if z2 == z1 then
    hsjsjs = schedule('c',0,2)
    sendText(ln,'§e将在4s后传送！移动即可取消传送')
  else
    sendText(ln,'取消传送成功！')
  end
end
function a(k,kk)
  if kk == ".tpr" then
    z1 = getPos(k)
    nsjsk =  schedule('b',0,2)
    ln = k
    sendText(k,'§e将在5s后传送！移动即可取消传送')
    return -1
  end
end
Listen('onChat','a')
print('随机传送已加载！ --作者wzy')
