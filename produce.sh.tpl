#!/bin/sh
cat <<EOF > /home/ec2-user/confluent-5.3.1/etc/schema-registry/schema-registry.properties
listeners=http://0.0.0.0:8081
kafkastore.connection.url=${zoo_keeper}
kafkastore.bootstrap.servers=PLAINTEXT://${broker_list}
kafkastore.topic=_schemas
debug=false
EOF
confluent-5.3.1/bin/schema-registry-start confluent-5.3.1/etc/schema-registry/schema-registry.properties &> /dev/null &
sleep 10
echo "slept"
confluent-5.3.1/bin/kafka-topics --create --zookeeper ${zoo_keeper} --replication-factor 1 --partitions 1 --topic test
echo '{"f1":"asdasda"}' | confluent-5.3.1/bin/kafka-avro-console-producer --topic test --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}' --broker-list ${broker_list}
