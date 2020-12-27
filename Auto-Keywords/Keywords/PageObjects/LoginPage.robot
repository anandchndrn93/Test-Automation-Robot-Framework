*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot
*** Variables ***

${LoginLogo}                        //div[@class='login_logo']
${LoginWrapper}                     //div[@class='login_wrapper']
${UsernameTextbox}                  id:user-name
${PasswordTextBox}                  id:password
${LoginButton}                      id:login-button
${LockedOutUserErrorText}           //input[@id='login-button']/ancestor::form/h3


*** Keywords ***

Navigate To LoginScreen
    Open Browser [CUSTOM]

Verify Login page is loaded
     WAIT UNTIL ELEMENT IS VISIBLE       ${LoginLogo}
     PAGE SHOULD CONTAIN ELEMENT         ${LoginWrapper}
     log to console                      login page was loaded

Enter valid user credentials
     Enter Text [Custom]     ${UsernameTextbox}     ${USERNAME}
     log to console          user name was entered
     Enter Text [Custom]     ${PasswordTextBox}     ${PASSWORD}
     log to console          password was entered

Login To Website
     log to console          loging in
     Click Element           ${LoginButton}
     Verify Product Page is Loaded
     log to console          successfully logged in

Enter locked out user credentials
     Enter Text [Custom]     ${UsernameTextbox}     ${LOCKED_OUT_USERNAME}
     log to console          user name was entered
     Enter Text [Custom]     ${PasswordTextBox}     ${PASSWORD}
     log to console          password was entered

click login and validate error message
     log to console                         loging in
     Click Element                          ${LoginButton}
     WAIT UNTIL PAGE CONTAINS ELEMENT       ${LockedOutUserErrorText}
     Element Should Contain                 ${LockedOutUserErrorText}          Sorry, this user has been locked out.
     log to console                         locked out user was not allowed to log in


