#!/bin/sh
set -e

echo "--------- Winzana Fixtures   ---------"
echo " "

sh -c "curl -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/person?pretty --data-binary @./docker/core/indices/person.json"   2>&1 /proc/self/fd/2
sh -c "curl -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/organization?pretty --data-binary @./docker/core/indices/organization.json"   2>&1 /proc/self/fd/2
sh -c "curl -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/product?pretty --data-binary @./docker/core/indices/product.json"   2>&1 /proc/self/fd/2
sh -c "curl -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/order?pretty --data-binary @./docker/core/indices/order.json"   2>&1 /proc/self/fd/2
sh -c "curl -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/calendar_event?pretty --data-binary @./docker/core/indices/calendar_event.json"   2>&1 /proc/self/fd/2
sh -c "curl -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/_all/_settings -d '{\"index\": {\"blocks\": {\"read_only_allow_delete\": \"false\"}}}'"   2>&1 /proc/self/fd/2
node ./fixtures/dev/load-fixtures.js || true
node ./fixtures/yamay/load-fixtures.js || true
sh -c "curl --request POST --url ${API_URL}/api/people/index --header 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InZpbmNlbnQrc2hvcFByb2R1Y3RAd2luemFuYS5jb20iLCJzdWIiOiIwNjQ2YTg5MC05YmY0LTRhMGUtODBiOC04M2E5ZmI3NGJlNjIiLCJpYXQiOjE1ODAwMjkxMTgsImV4cCI6MTU4MDYzMzkxOH0.0xkMxe6Bj9p-wAJc57sn39WCxRPoUzBWA2Use0AfFSY' --header 'x-wz-api-key: 4e1c05e8-7d4f-4661-bb6e-8cfaa5959855' --header 'x-wz-api-secret: 47e80119-de11-451b-8f3e-43ea47fc2fa3'"
sh -c "curl --request POST --url ${API_URL}/api/shop/orders/index --header 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InZpbmNlbnQrc2hvcFByb2R1Y3RAd2luemFuYS5jb20iLCJzdWIiOiIwNjQ2YTg5MC05YmY0LTRhMGUtODBiOC04M2E5ZmI3NGJlNjIiLCJpYXQiOjE1ODAwMjkxMTgsImV4cCI6MTU4MDYzMzkxOH0.0xkMxe6Bj9p-wAJc57sn39WCxRPoUzBWA2Use0AfFSY' --header 'x-wz-api-key: 4e1c05e8-7d4f-4661-bb6e-8cfaa5959855' --header 'x-wz-api-secret: 47e80119-de11-451b-8f3e-43ea47fc2fa3'"
sh -c "curl --request POST --url ${API_URL}/api/shop/products/index --header 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InZpbmNlbnQrc2hvcFByb2R1Y3RAd2luemFuYS5jb20iLCJzdWIiOiIwNjQ2YTg5MC05YmY0LTRhMGUtODBiOC04M2E5ZmI3NGJlNjIiLCJpYXQiOjE1ODAwMjkxMTgsImV4cCI6MTU4MDYzMzkxOH0.0xkMxe6Bj9p-wAJc57sn39WCxRPoUzBWA2Use0AfFSY' --header 'x-wz-api-key: 4e1c05e8-7d4f-4661-bb6e-8cfaa5959855' --header 'x-wz-api-secret: 47e80119-de11-451b-8f3e-43ea47fc2fa3'"
sh -c "curl --request POST --url ${API_URL}/api/organizations/index --header 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InZpbmNlbnQrc2hvcFByb2R1Y3RAd2luemFuYS5jb20iLCJzdWIiOiIwNjQ2YTg5MC05YmY0LTRhMGUtODBiOC04M2E5ZmI3NGJlNjIiLCJpYXQiOjE1ODAwMjkxMTgsImV4cCI6MTU4MDYzMzkxOH0.0xkMxe6Bj9p-wAJc57sn39WCxRPoUzBWA2Use0AfFSY' --header 'x-wz-api-key: 4e1c05e8-7d4f-4661-bb6e-8cfaa5959855' --header 'x-wz-api-secret: 47e80119-de11-451b-8f3e-43ea47fc2fa3'"
