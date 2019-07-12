#### 常用的linux脚本命令

### 批量修改文件名
>ls *|awk -F '_' '{print"mv "$0" "$1$2""}'|bash      


### 拼接json，输出双引号
>1,cat COCA_null |awk -F' ' '{print "{\""   "word" "\":" $1 "},"}'>COCA_null.json;      