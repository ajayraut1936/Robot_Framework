*** Settings ***
Library    SeleniumLibrary
Variables  ../Resource/Locators.py
Variables  ../Resource/Suite.yaml
Resource  ../Keyword/Pom_keyword.robot


*** Keywords ***


Open My Browser
    [Arguments]   ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Enter Username
    [Arguments]   ${username}
    Input Text    ${TC_01_uid}    ${username}

Enter Password
    [Arguments]    ${pass}
    Input Password    ${TC_01_pass}   ${pass}

Click Sign in
    Click Button   ${TC_01_sub}


close my browser
    Close Browser
# Login Browser
#     [Arguments]    ${url}   ${uid}   ${pass}
#     Open Browser    ${url}    edge
#     # ${username}     Set Variable    standard_user
#     # ${password}     Set Variable    secret_sauce
#     Maximize Browser Window
#     Wait Until Element Is Visible    //*[@id="root"]/div[1]/div[1]
#     Input Text    //*[@data-test="username"]     ${uid}
#     Input Password    //*[@data-test="password"]    ${pass}
#     Click Button    //*[@value="Login"]
#     Sleep     5s