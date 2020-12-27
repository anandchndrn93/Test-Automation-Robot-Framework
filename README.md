# Test-Automation-Robot-Framework
This is a sample Test Automation framework using Robot Framework

The freamework automates 6 test cases for https://www.saucedemo.com/.  Tests have tags REG and SANITY. Tests can be run based on their tages in parallel

Desing pattern followed is page object model. Test Setup and Tear down has been added. The browsers used are chrome and firefox.

# Requirements
robotframework                   3.2.2

robotframework-dependencylibrary 1.0.0.post1

robotframework-pabot             1.10.0

robotframework-pythonlibcore     2.1.0

robotframework-selenium2library  3.0.0

robotframework-seleniumlibrary   4.5.0

selenium                         3.141.0


# How to run
Open Auto-Core/config/configuration.robot and enter browser

Open Auto-Core/config/Data.robot and enter the product name

Run the command   pabot --processes 2 --outputdir results -i SANITY Auto-Scripts/Tests to run Sanity rests.  The number 2 denotes the parrallel threads being run.

Run the command   pabot --processes 2 --outputdir results -i REG Auto-Scripts/Tests to run Regression tests. The number 2 denotes the parrallel threads being run.

Reports and logs can be found in results folder
