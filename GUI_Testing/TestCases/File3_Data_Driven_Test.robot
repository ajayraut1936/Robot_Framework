*** Settings ***
Library    SeleniumLibrary
Resource  ../Keywords/Common_Keywords.robot
Variables  ../Resourses/Suite.yaml

Suite Setup    Log To Console   This is Suite Setup
Suite Teardown    Log To Console   This is Suite Teardown
*** Keywords ***
Check invalid login   
    [Arguments]     ${uld}     ${pass}
    Login Browser    ${TC_02.url}    ${uld}    ${pass}
    Sleep  5s
    ${error_text}    Get Text    //*[@data-test="error"]
    Should Contain   ${error_text}     Epic sadface: Username and password do not match any user in this service
    Log To Console     ${error_text}


*** Test Cases ***
TC_01
    [Setup]    Log To Console    This is Test Setup
    [Teardown]    Log To Console    This is Test Teardown
    [Tags]   TC_01
    Check invalid login   ajay    123
    Check invalid login   ajay1    1234
    Check invalid login   ajay3    12355
    Check invalid login   ajay4    123666


