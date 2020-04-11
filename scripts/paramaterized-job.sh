mys3buc=$1
paramaters=''

echo "download buildtrigger from artifatory"
curl -utd-transformation:mBS8bCN2HKgAymj2 -L "https://mys3bucartifactory.jfrog.io/buildtrigger-0.2.tar.gz" -o /tmp/wrk-buildtrigger-0.2.tar.gz
cd /tmp
tar -xzvf /tmp/wrk-buildtrigger-0.2.tar.gz
chmod +x /tmp/buildtrigger/remote-job.sh
cd /tmp/buildtrigger

sudo yum install jq -y

echo "Building paramaters ..."
for var in "${@:2}"
do
    echo "$var"
    paramaters="$paramaters -p $var"
done

echo "paramaters built: $paramaters"

echo "./remote-job.sh -u http://ec2-54-152-xxx-xxx.compute-1.amazonaws.com:8080 -j $mys3buc $paramaters -t ABC -s admin -r aaaaaaaaaaaaaaaaaaaaaaaa -i > log.txt"
