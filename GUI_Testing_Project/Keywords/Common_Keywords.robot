*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Login Browser
    [Arguments]    ${url}   ${uid}   ${pass}
    Open Browser    ${url}    edge
    # ${username}     Set Variable    standard_user
    # ${password}     Set Variable    secret_sauce
    Maximize Browser Window
    Wait Until Element Is Visible    //*[@id="root"]/div[1]/div[1]
    Input Text    //*[@data-test="username"]     ${uid}
    Input Password    //*[@data-test="password"]    ${pass}
    Click Button    //*[@value="Login"]
    Sleep     5s