*** Settings ***
Library   SeleniumLibrary

Variables  ../Resource/Locators.py
Variables  ../Resource/Suite.yaml
Resource  ../Keyword/Pom_keyword.robot

*** Variables ***
${Browser}   edge

*** Keywords ***

*** Test Cases ***

TC_01_POM
    [Documentation]   POM structure SMALL PROJECT
    [Tags]
    Open My Browser    ${TC_01.url}    ${Browser}
    Sleep  2s
    Enter Username    ${TC_01.username}
    Sleep  2s
    Enter Password   ${TC_01.password}
    Sleep  2s
    Click Sign in
    Sleep  2s
    close my browser
    Sleep  2s


