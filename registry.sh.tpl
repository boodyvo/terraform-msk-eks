#!/bin/sh
cat <<EOF > /home/ec2-user/confluent-5.3.1/etc/schema-registry/schema-registry.properties
listeners=http://0.0.0.0:8081
kafkastore.connection.url=${zoo_keeper}
kafkastore.bootstrap.servers=PLAINTEXT://${broker_list}
kafkastore.topic=_schemas
debug=false
EOF
echo "slept"
confluent-5.3.1/bin/schema-registry-start confluent-5.3.1/etc/schema-registry/schema-registry.properties
