docker create --name rabbit_autocluster pivotalrabbitmq/rabbitmq-autocluster
mkdir ./tmp/rabbit_autocluster
docker export rabbit_autocluster | gzip > ./tmp/rabbit_autocluster/fs.tar


docker create --name consul_rabbit consul
mkdir ./tmp/consul_rabbit
docker export consul_rabbit | gzip > ./tmp/consul_rabbit/fs.tar

