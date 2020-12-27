*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot
Library  DependencyLibrary
Suite Setup     Navigate To LoginScreen
Suite Teardown     CLOSE ALL BROWSERS


*** Test Cases ***
TC-1: verify User can Login
    [Tags]      REG  SANITY
    Enter valid user credentials
    Login To Website

TC-2 verify user can logout
     Depends on test  TC-1: verify User can Login
     [Tags]      REG  SANITY
     Open Menu and click logout
     Verify Login page is loaded

TC-3 Verify locked out user cannot log in
     [Tags]      REG
     Enter locked out user credentials
     click login and validate error message