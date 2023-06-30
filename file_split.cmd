@echo off

java -jar jmeter_file_splitter.jar \scripts\UC01\UC01_user.csv 2 1
java -jar jmeter_file_splitter.jar \scripts\UC02\UC01_user.csv 2 2

