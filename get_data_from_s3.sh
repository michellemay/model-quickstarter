#!/bin/bash
#+------------------------------------------------------------------------------------------------------------------------------+
#| Copy files from S3 bucket to model-quickstarter wdir
#| @author Michel Lemay
#+------------------------------------------------------------------------------------------------------------------------------+

# $1 wdir
# $2 Locale: en_US
# $3 s3://bucketname/

usage ()
{
     echo "get_data_from_s3.sh"
     echo "usage: ./get_data_from_s3.sh wdir en_US s3://bucketname"
     echo " "
}


if [ $# != 3 ]
then
    usage
    exit
fi


S3_BUCKET="$3/data/$2"
LANGUAGE=`echo $2 | sed "s/_.*//g"`

BASE_DIR=$(pwd)

if [[ "$1"  = /* ]]
then
   BASE_WDIR="$1"
else
   BASE_WDIR="$BASE_DIR/$1"
fi

WDIR="$BASE_WDIR/$2"

echo "Language: $LANGUAGE"
echo "Working directory: $WDIR"
echo "S3 bucket: $S3_BUCKET"

mkdir -p $WDIR
cd $WDIR
if [ ! -f "redirects.nt" ]; then
  s3cmd get "$S3_BUCKET/dbpedia/disambiguations.nt"
  s3cmd get "$S3_BUCKET/dbpedia/instance_types.nt"
  s3cmd get "$S3_BUCKET/dbpedia/redirects.nt"
fi

#if ! hadoop fs -test -e ${LANGUAGE}wiki-latest-pages-articles.xml ; then
#  s3cmd get "$S3_BUCKET/wiki/${LANGUAGE}wiki-latest-pages-articles.xml" ${LANGUAGE}wiki-latest-pages-articles.xml
#  hadoop fs -moveFromLocal ${LANGUAGE}wiki-latest-pages-articles.xml ${LANGUAGE}wiki-latest-pages-articles.xml
#  if ! hadoop fs -test -e ${LANGUAGE}wiki-latest-pages-articles.xml ; then
#    echo "Dump should be in HDFS!!"
#  fi
#fi


