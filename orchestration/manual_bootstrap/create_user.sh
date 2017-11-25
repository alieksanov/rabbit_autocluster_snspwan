
# {"password":"secret","tags":"administrator"}

curl -i -u guest:12345 -H "content-type:application/json" \
        -XPUT  -d'{"password":"secret","tags":"administrator"}' \ 
        http://rabbitsensu-2-003.shared.adm.las1.mz-inc.com:15672/api/users/sensu 

