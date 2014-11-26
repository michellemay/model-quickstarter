#!/bin/bash

git clone https://github.com/dbpedia-spotlight/demo.git
git clone https://github.com/dbpedia-spotlight/dbpedia-spotlight.git
cp -r demo/* dbpedia-spotlight/rest-tomcat/src/web
mkdir dbpedia-spotlight/build
for language in da de es fr hu it pt  en_2+2  en_2+3  en_3+5  en_4+8; do

	wget http://spotlight.sztaki.hu/downloads/$language.tar.gz
	tar xvf $language.tar.gz 
	mv $language dbpedia-spotlight/rest-tomcat/src/main/resources
	echo "org.dbpedia.spotlight.config.filename=./$language" > dbpedia-spotlight/rest-tomcat/src/main/resources/tomcat_spotlight.properties
	cd dbpedia-spotlight
	mvn install
	rm rest-tomcat/src/main/resources/* -r
        cp rest-tomcat/target/dbpedia-spotlight.war build/dbpedia-spotlight-$language.war
        mvn clean
        cd ..
done



