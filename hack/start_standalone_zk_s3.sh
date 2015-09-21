#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker run -it --rm \
	-p 48080:8080 \
	-p 42181:2181 \
	-p 42888:2888 \
	-p 43888:3888 \
        $IMAGE \
	java -jar exhibitor-1.5.5.jar \
	-c s3 --s3region "us-east-1" --s3config "$S3_BUCKET:$S3_CONF_FILE" --s3configprefix "$S3_LOCK" \
	--jquerystyle custom --defaultconfig conf/exhibitor.conf
