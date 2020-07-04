# bdx-lua-Tland
bdx插件，添加私人化自定义领地进出提示 

玩家可以自定义领地进入/离开提示。 
默认为 欢迎来到<主人名>的领地！ 

# 指令：
.landw set <文本类型> <进入提示> 
.landl set <文本类型> <离开提示>     
支持带颜色。 
# 文本类型: 
RAW = 0, //聊天框        
POPUP = 3, //物品栏上     
JUKEBOX_POPUP = 4, //音乐盒位置     
TIP = 5 //物品栏上      
# 举例： 
.landw set 3 §ewelcome     
.landl set 5 §ebye 
