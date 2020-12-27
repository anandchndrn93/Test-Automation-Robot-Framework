*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot

*** Variables ***
${Finishtext}           //div[@id='header_container']/following-sibling::div[@class='subheader']
${Confirmationtext}     //div[@id='checkout_complete_container']/h2
*** Keywords ***

verifiy confirmation page is loaded
    Wait Until Page Contains Element   ${OverViewtext}              ${DURATION_S}
    log to console                     confirmation page is loaded

confirm purchase
    Element Text Should Be             ${Confirmationtext}             THANK YOU FOR YOUR ORDER
    log to console                     product purchase is complete

