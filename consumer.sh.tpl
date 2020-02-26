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
confluent-5.3.1/bin/kafka-avro-console-consumer --from-beginning --topic test --bootstrap-server ${broker_list} > ~/consume.log
