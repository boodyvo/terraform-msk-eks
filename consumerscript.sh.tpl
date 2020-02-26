#!/bin/sh
confluent-5.3.1/bin/schema-registry-start confluent-5.3.1/etc/schema-registry/schema-registry.properties &> /dev/null &
sleep 10
confluent-5.3.1/bin/kafka-avro-console-consumer --from-beginning --topic test --bootstrap-server ${broker_list} > ~/consume.log
