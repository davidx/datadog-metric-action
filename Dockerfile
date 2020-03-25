FROM debian:9.6-slim

LABEL "com.github.actions.name"="DataDog Metric Trigger"
LABEL "com.github.actions.description"="Trigger DataDog Metric from GitHub Actions"
LABEL "com.github.actions.icon"="hash"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.0"
LABEL repository="https://github.com/davidx/datadog-metric-action"
LABEL homepage="https://github.com/davidx/datadog-metric-action"
LABEL maintainer="David Andersen <davidx@gmail.com>"

RUN apt-get update && apt-get install -y curl

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
