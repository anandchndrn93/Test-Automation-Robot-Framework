*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot
*** Variables ***
${OverViewtext}           //div[@id='header_container']/following-sibling::div[@class='subheader']
${FinishLink}             //a[text()='FINISH']
${CancelLink}             //a[text()='CANCEL']

*** Keywords ***
verifiy overview page is loaded
    Wait Until Page Contains Element   ${OverViewtext}              ${DURATION_S}
    log to console                     overview  page is loaded

finish puchase
    Click Element          ${FinishLink}
    log to console         purchase confirmed
    verifiy confirmation page is loaded

Cancel purchase
    log to console         cancel product purchase
    Click Element          ${CancelLink}
    Verify Product Page is Loaded
    log to console                     product purchase cancelled
