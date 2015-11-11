#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker run -d \
	-p 8080:8080 \
	-p 2181:2181 \
	-p 2888:2888 \
	-p 3888:3888 \
        $IMAGE \
	java -jar exhibitor-1.5.5.jar \
	-c s3 --s3region "us-east-1" --s3config "$S3_BUCKET:$S3_CONF_FILE" --s3configprefix "$S3_LOCK" \
	--defaultconfig conf/exhibitor.conf
