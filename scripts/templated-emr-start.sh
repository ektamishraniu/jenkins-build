cluster_name=$1
template_id=$2
emr_release=$3
if [ ! -f /tmp/running ];
then
    echo "File not found!"
    touch /tmp/running
else
       echo "job not complete" && exit 0
fi

echo "download buildtrigger from artifatory"
curl -utd-transformation:mBS8bCN2HKgAymj2 -L "https://mys3bucartifactory.jfrog.io/0.2.tar.gz" -o /tmp/wrk-buildtrigger-0.2.tar.gz
cd /tmp
tar -xzvf /tmp/wrk-buildtrigger-0.2.tar.gz
chmod +x /tmp/buildtrigger/remote-job.sh
cd /tmp/buildtrigger

sudo yum install jq -y

./remote-job.sh -u http://54.152.136.251:8080 -j templated-emr-create -p "clustername=$cluster_name" -p "templateid=$template_id" -p "releaseid=$emr_release" -p "region=us-east-1a" -t ABC -s admin -r 450ca06e1467e633eabc365729934517 -i > log.txt
rm /tmp/running