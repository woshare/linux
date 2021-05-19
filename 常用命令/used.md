#### 常用的linux脚本命令

### 批量修改文件名
>ls *|awk -F '_' '{print"mv "$0" "$1$2""}'|bash      


### 拼接json，输出双引号
>1,cat COCA_null |awk -F' ' '{print "{\""   "word" "\":" $1 "},"}'>COCA_null.json;      
 
### win文件到linux文件：Vim 中如何去掉 ^M 字符
>1,win下的文档上传到linux，每行的结尾都会出现一个^M，(^M是ctrl+v,ctrl+m)    
>2,单个文档的话，可以用vi打开，执行 :%s/^M//g　来去掉^M        
>3,用dos2unix工具 :find ./ -type f -print0 | xargs -0 dos2unix      
>4,用sed命令:find ./ -type f print0 | xargs -0 sed -i 's/^M$//'    
>5,:set ff=unix            


### 后台运行，输入重定向：node scraper_jianqiao_dic.js >log.txt 2>&1 &


## 别名永久化
>1，alias cp='cp -i'
>2，若要每次登入就自动生效别名，则把别名加在/etc/profile或~/.bashrc中。然后# source ~/.bashrc
>3，若要让每一位用户都生效别名，则把别名加在/etc/bashrc最后面，然后# source /etc/bashrc

### xshell突然不能输入解决办法  一般是按到了ctrl+S导致关闭流输入 ctrl+q退出即可


### xargs 
>head mp3_size_zero.log |xargs -n1 -I {} find -name {}

### find
>1，size=0：find "$dir" -size 0 -print

>2，find * -size 0 -print|xargs -n1 -I {} rm -rf {}

