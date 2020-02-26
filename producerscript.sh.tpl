#!/bin/sh
confluent-5.3.1/bin/schema-registry-start confluent-5.3.1/etc/schema-registry/schema-registry.properties &> /dev/null &
sleep 10
confluent-5.3.1/bin/kafka-topics --create --zookeeper ${zoo_keeper} --replication-factor 1 --partitions 1 --topic test
echo '{"f1":"asdasda"}' | confluent-5.3.1/bin/kafka-avro-console-producer --topic test --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}' --broker-list ${broker_list}