a = 1 --每次备份的时间间隔，单位分钟，其他设置请看bf.sh
print("自动备份已装载，作者wzy，反馈bug请加QQ382271046")
function u_backup()
  os.execute('sh ./bf.sh')
end
function w()
  runCmd('say 10秒后将进行备份')
  ww = schedule("u_backup",0,20)
end
function z()
  runCmd('say 30秒后将进行备份')
  zz = schedule("w",0,40)
end
function y()
  runCmd('say 60秒后将进行备份')
  yy = schedule("z",0,60)
end  
yyyyyyyy = schedule("y",a*120-120,a*120-120)
