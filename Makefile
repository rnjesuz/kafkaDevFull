start:
	docker-compose up -d

stop:
	docker-compose stop

cleanup:
	docker-compose down

register_topic:
	./kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic stub

populate_topic:
	echo test | kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic stub

list__messages:
	./kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic stub --from-beginning

list_topics:
	./kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092

delete__topic:
	./kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic stub
