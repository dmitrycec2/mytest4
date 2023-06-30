#!/bin/bash

splitcount=${1}
splitnumber=${2}

java -jar jmeter_file_splitter.jar scripts//UC01//UC01_user.csv ${splitcount} ${splitnumber}
java -jar jmeter_file_splitter.jar scripts//UC02//UC01_user.csv ${splitcount} ${splitnumber}





