#! /bin/sh

echo "Cloning bitcore..."
sh setup_bitcore.sh &> /dev/null

rm -f success failure
touch success failure

IFS=$'\n'
repositories=`cat repositories`
echo $repositories
for line in $repositories; do
  IFS=$' '
  package=($line)
  owner=${package[0]}
  repo=${package[1]}
  echo "Testing $owner/$repo..."
  sh pull.sh $owner $repo &> /dev/null
  if [[ $? != 0 ]]; then
    echo "(failed)"
  else
    echo "(successful)"
  fi
done < repositories

echo "Cleaning up..."
sh cleanup_bitcore.sh &> /dev/null

echo "Successfully tested:" $(wc -l success)
echo "Failures:           " $(wc -l failure)
cat failure
