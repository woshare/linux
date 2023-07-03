file=stateQuestion.csv

q=""
stateOpts=""
s=""
l=0
n=1
while read line
do
    question=`echo $line|awk -F ',' '{print $1}'`
    option=`echo $line|awk -F ',' '{print $2}'`
    emotionId=`echo $line|awk -F ',' '{print $3}'`
    defaultContent=`echo $line|awk -F ',' '{print $4}'`
    sce=`echo $line|tr -s "\r\n" " "|sed 's/ //g'|awk -F ',' '{print $5}'|awk -F'，' '{for(i=1;i<=NF;i++){ to=to",\""$i"\""}; print to}'`
    scenes=`echo ${sce:1}`
    #echo question=$question
    #echo option=$option
    #echo emotionId=$emotionId
    #echo defaultContent=$defaultContent
    #echo $scenes
    stateOpt="{\"option\":\"$option\",\"stateEmotionId\":\"$emotionId\",\"defaultContent\":\"$defaultContent\"}"
    #echo stateOpt=$stateOpt
    #preEmpty=0
    l=`expr $l + $n`
    #echo pre=$preEmpty , question=$question
    if [[ -z $question ]];
    then
        echo ''
    else
        if [ $l -gt 1 ]
        then
            stateOpts="["$stateOpts"]"
            sceness="["$s"]"
            echo "insert into yay.state_question(question,answer_options,scene) value("\'$q\'","\'$stateOpts\'","\'$sceness\'")"
        fi
    fi

    if [[ -z $question ]];
    then
	stateOpts=$stateOpts","$stateOpt
	#preEmpty=1
    	#stateOpts[${#stateOpts[@]}]=stateOpt
    else
	#stateOpt="["$stateOpt"]"
    	#scenes="["$scenes"]"
	#echo question=$question",stateOpts="$stateOpts",scenes="$scenes
	stateOpts=$stateOpt
	q=$question
        s=$scenes
	#preEmpty=
    fi
    
done < $1
