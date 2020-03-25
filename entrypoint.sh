#!/bin/bash
set -e

if [[ -z "$DATADOG_API_KEY" || -z "$METRIC_NAME" || -z "$METRIC_VALUE" ]]; then
  echo "One or more required variables are missing: DATADOG_API_KEY, METRIC_NAME, METRIC_VALUE"
  exit 1
fi

if [[ -z "$METRIC_TYPE" ]]; then
  # normal or low
  METRIC_TYPE="count"
fi

if [[ -z "$METRIC_INTERVAL" ]]; then
  # normal or low
  METRIC_INTERVAL=20
fi

if [[ -z "$METRIC_TYPE" ]]; then
  # normal or low
  METRIC_TYPE="count"
fi

if [[ -z "$METRIC_HOST" ]]; then
  # normal or low
  METRIC_HOST="drone.parsleyhealth.com"
fi

if [[ -z "$METRIC_TAGS" ]]; then
  # normal or low
  METRIC_TAGS="[  ]"
fi

current_time=`date +%s`
METRIC_JSON="{ \"series\":  [{ \"metric\":\"${METRIC_NAME}\",
                              \"points\":[[$current_time,${METRIC_VALUE}]],
                              \"type\":\"${METRIC_TYPE}\",
                              \"interval\": ${METRIC_INTERVAL},
                              \"host\":\"${METRIC_HOST}\",
                              \"tags\": ${METRIC_TAGS}
                            }]
            }"

DATADOG_URL="https://api.datadoghq.com/api/v1/series?api_key=${DATADOG_API_KEY}"
curl  -X POST -H "Content-type: application/json" -d "$METRIC_JSON" "$DATADOG_URL"
