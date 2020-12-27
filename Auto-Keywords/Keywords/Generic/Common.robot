*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot
Library  OperatingSystem
#Suite Setup  Setup chromedriver
*** Variables ***

*** Keywords ***

Open Browser [CUSTOM]
    [Documentation]    Launch Browser
    [Arguments]    ${URL}=${HTML-Url}    ${Browser}=${BROWSER}
    log to console     launching browser ${Browser}
    RUN KEYWORD IF    '${Browser}' == 'chrome'
    ...        RUN KEYWORD
    ...        Open Chrome      ${URL}
    ...        ELSE IF    '${Browser}' == 'firefox'
    ...        Open Firefox     ${URL}
    Maximize Browser Window

Open Chrome
    [Documentation]    Launch chrome
    [Arguments]        ${URL}
    ${options}=   Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
    Call Method    ${options}    add_argument   disable-infobars
    Open Browser   ${URL}      chrome

Open Firefox
    [Arguments]     ${URL}
    Open Browser    ${URL}    ff

Enter Text [Custom]
    [Arguments]     ${element}     ${text}
    Clear Element Text      ${element}
    Input Text              ${element}         ${text}


