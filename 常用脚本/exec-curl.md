#
```



file=exmple-file.txt
cmdpre="curl  -s  https://xxx.com/interface?req=%7b%22uid%22%3a+%22"
cmdend="%22%2c%22start_time%22%3a%222010-08-20%22%2c%22end_time%22%3a%222021-03-01%22%7d"
while read line
do
    #ret=`echo $line|sed 's/\r\n//g'`
    uid=`echo $line |tr -s "\r\n" " "|sed 's/ //g'` 去掉按行读的换行符
    cmd=$cmdpre$uid$cmdend
    #echo $cmd
    rsp=`$cmd`   执行cmd中的curl命令 ，得到rsp结果
    #echo $rsp
    result=`echo $rsp|awk -F '[,:]' '{print $7 "," $9 "," $11 ","$13}'|awk -F '}' '{print $1}'|sed 's/"//g'`
    #echo $result
    echo $uid","$result
done < $file

#cmd="curl  -s  https://recite.perfectlingo.com/user-stat/get-cumulative-h5?req=%7b%22uid%22%3a+%2210013967%22%2c%22start_time%22%3a%222010-08-20%22%2c%22end_time%22%3a%222021-03-01%22%7d"
#result=`$cmd`

#echo $result|awk -F '[,:]' '{print $7 "," $9 "," $11 ","$13}'|awk -F '}' '{print $1}'|sed 's/"//g'
```