#!/usr/bin/env bash

# 定义文件路径
bf_dir=/root/mc/worlds 
# 定义备份路径
bf_bak_dir=/root/mc/lua
# 定义输出日志路径
bf_log_dir=/root/mc/lua
# 达到大于多少备份文件开始删除
bf_file_num=5
# 达到指定数量文件删除几个老的备份
bf_del_num=1

exec &>> $bf_log_dir/bf_bak.log

date_t() {
        echo -n "$(date "+%Y年%m月%d日 %H:%M:%S:")  "
        }

bf_bak_num=`ls $bf_bak_dir | wc -l`
if [[ $bf_bak_num -gt $bf_file_num ]];then
	date_t
	echo "备份目录有文件${bf_bak_num}大于${bf_file_num}个文件，开始执行删除备份文件..."
	del_bf=`ls -lrt ${bf_bak_dir}/*.tgz | awk '{print $9}' | grep -v "^$" | head -${bf_del_num}`
	del_suc=0
	for i in $del_bf;do
		rm -f $i
		if [[ $? -eq 0 ]];then
			let del_suc+=1
		fi
		date_t
		echo "$i 文件删除成功"
	done
	
	date_t
	echo "删除成功备份目录${del_suc}个备份文件"
	date_t
	echo "备份目录目前剩余${bf_bak_num}文件"
	date_t
	echo "正在备份bf文件..."
	tar zcvPf ${bf_bak_dir}/Bedrock_level$(date "+%Y-%m-%d_%H:%M:%S").tgz  $bf_dir &>/dev/null
	if [[ $? -eq 0 ]];then
		bf_new_file=`ls -lt ${bf_bak_dir}/*.tgz | awk '{print $9}' | grep -v "^$" | head -1`
		date_t
		echo "bf文件${bf_new_file} 备份成功"
		echo ""
	fi
else
	date_t
	echo "备份目录有文件${bf_bak_num}个"
	date_t
	echo "正在备份bf文件..."
	tar zcvPf ${bf_bak_dir}/Bedrock_level$(date "+%Y-%m-%d_%H:%M:%S").tgz $bf_dir &>/dev/null
	if [[ $? -eq 0 ]];then
                bf_new_file=`ls -lt ${bf_bak_dir}/*.tgz | awk '{print $9}' | grep -v "^$" | head -1`
               	date_t
	 	echo "bf文件${bf_new_file} 备份成功"
		echo ""
        fi
fi

