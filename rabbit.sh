# create exchange
curl -i -u guest:guest -H "content-type:application/json" \
    -XPUT -d'{"type":"fanout","durable":true}' \
    http://localhost:15672/api/exchanges/%2f/my.exchange.name
    
# create queue
curl -i -u guest:guest -H "content-type:application/json" \
    -XPUT -d'{"durable":true,"arguments":{"x-dead-letter-exchange":"", "x-dead-letter-routing-key": "my.queue.dead-letter"}}' \
    http://localhost:15672/api/queues/%2f/my.queue

# create queue related dead letter queue
curl -i -u guest:guest -H "content-type:application/json" \
    -XPUT -d'{"durable":true,"arguments":{}}' \
    http://localhost:15672/api/queues/%2f/my.queue.dead-letter
    
# create binding
curl -i -u guest:guest -H "content-type:application/json" \
    -XPOST -d'{"routing_key":"","arguments":{}}' \
    http://localhost:15672/api/bindings/%2f/e/my.exchange/q/my.queue
