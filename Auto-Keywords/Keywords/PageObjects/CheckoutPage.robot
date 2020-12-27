*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot

*** Variables ***
${CheckOutText}            //div[@id='header_container']/following-sibling::div
${FirstNameTextbox}        id:first-name
${LastName TextBox}        id:last-name
${ZipCodeTextBox}          id:postal-code
${Continuelink}            //input[@value='CONTINUE']
*** Keywords ***
Verify checkout page is loaded
     Wait Until Page Contains Element   ${CheckOutText}              ${DURATION_S}
     log to console                     check out page is loaded

fill in details for check out
    Enter Text [Custom]     ${FirstNameTextbox}      ${USERNAME}
    log to console          first name entered
    Enter Text [Custom]     ${LastName TextBox}       demo
    log to console          last name enetered
    Enter Text [Custom]     ${ZipCodeTextBox}         670888
    log to console          zip code entered

Continue to review purchase items
    Click Element           ${Continuelink}
    log to console          moving to review page
    verifiy overview page is loaded

