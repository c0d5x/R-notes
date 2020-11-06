# generated with
# aws s3 ls --recursive s3://bucket > all-recursive.txt
# cat all-recursive.txt|cut -c 32- > objects.txt
# cat objects.txt|awk -F/ '{print $2}'|sort -u>vendors.txt
# for vendor in $(cat vendors.txt); do
#   aws s3 ls --recursive s3://costs.prod.recruitics.com/vendor/$vendor > $vendor.txt
#   wc -l $vendor.txt
# done
# wc -l *.txt|sort -nr>Rx-vendors.txt
# vim Rx-vendors.txt  # to replace spaces with , and add header files,vendor

totals <- read.csv("Rx-vendors-pie.csv", header=TRUE)
totals$vendor <- as.factor(totals$vendor)
summary(totals)

pie(totals$files,totals$vendor)
