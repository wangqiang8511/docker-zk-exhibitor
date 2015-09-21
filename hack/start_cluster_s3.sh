#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

SIZE=${SIZE:-3}

for i in $(seq 1 $SIZE)
do
docker run -d \
	--hostname=zk$i \
        $IMAGE \
	java -jar exhibitor-1.5.5.jar \
	-c s3 --s3region "us-east-1" --s3config "$S3_BUCKET:$S3_CONF_FILE" --s3configprefix "$S3_LOCK" \
	--defaultconfig conf/exhibitor.conf
done
