
# {"password":"secret","tags":"administrator"}
# {"configure":".*","write":".*","read":".*"}

curl -i -u guest:12345 -H "content-type:application/json" \
        -XPUT  -d'{"configure":".*","write":".*","read":".*"}' \ 
        http://rabbitsensu-2-003.shared.adm.las1.mz-inc.com:15672/api/permissions/sensu/sensu

