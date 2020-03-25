# 🐶 DataDog Metrics - GitHub Action

A GitHub Action that triggers DataDog Metrics.

## Usage

```
- name: DataDog Metric
  uses: parsleyhealth/datadog-metric-action@1.0.1
  env:
    DATADOG_API_KEY: ${{ secrets.DATADOG_API_KEY_STAGING }}
    METRIC_NAME: "com.parsleyhealth.cicd.test"
    METRIC_VALUE: 34
    METRIC_TAGS: "[ \"environment:staging\",
                  \"componentname:data-api\",
                  \"reponame:cicd\",
                  \"branchname:feature/test\",
                  \"gitsha:liwefjowerigjowi4jgot4\",
                  \"gitauthor:davidx@gmail.com\"
               ]"

```

### Metric Tags

Metric Tags should be an array of different key/value pairs.

Example:
```
METRIC_TAGS: "['app:test','env:production']"
```

### Testing

```
 docker build . -t datadogmetric
 docker run  -e DATADOG_API_KEY=7e70EXAMPLEdd -e METRIC_NAME=com.parsleyhealth.cicd.test -e METRIC_VALUE=23 datadogmetric:latest

```
