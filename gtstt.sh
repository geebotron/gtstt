#! /bin/bash

sql_head="SELECT nie:url(?image)
WHERE {
?image a nfo:Image"
sql_tags=
sql_date_filter=
sql_foot="
}
ORDER BY DESC(nie:contentCreated(?image))"
tags_arr=
sql_lim=
sql_final=

while getopts t:l:y: opt
do
    case $opt in
        t)  tags_arr=(${OPTARG//,/ })
            ;;
        l)  sql_lim=" LIMIT ${OPTARG}"
            ;;
        y)  sql_date_filter="
;nie:contentCreated ?date .
FILTER (?date >= '${OPTARG}-01-01T00:00:00'
&& ?date <  '${OPTARG}-12-31T00:00:00')"
            ;;
    esac
done

shift $((OPTIND - 1))

for i in "${tags_arr[@]}"; do
    sql_tags="${sql_tags}
;nao:hasTag [ nao:prefLabel '$i' ]"
done

sql_final="${sql_head}\
    ${sql_tags}\
    ${sql_date_filter}\
    ${sql_foot}\
    ${sql_lim}"

#echo "${sql_final}"

   tracker-sparql -q "${sql_final}" \
       | grep -o 'file:///.*' \
       | xargs gthumb
#    | xargs feh -t -W 1200 -. --index-info %u -
