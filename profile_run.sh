#!/bin/bash

mk_params() {
	cd profiles/${profile_name}
	java -jar ../../jmeter_parser_ALL.jar scripts_params.xlsx true ${script_file} ${scripts_names}
	
	
	cd ${C_DIR}
	}
 
# SET VAR AND DIR
profile_name=${1}
scripts_names=${2}
script_file=${3}

mkdir -p results/${profile_name}
C_DIR=$PWD

# CREATE FILE PARAMS:
mk_params ${script_file} ${scripts_names}

# START TEST:
echo "Start Test"
sh ./jmeter-start-test.sh ${script_file} ${profile_name}



