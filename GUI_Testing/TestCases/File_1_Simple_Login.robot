*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
# Variables    ${EXECDIR}/GUI_Testing/Resourses/Suite.yaml
# Resource     ${CURDIR}/GUI_Testing/Keywords/Common_Keywords.robot
Variables    ../Resourses/Suite.yaml
Resource    ../Keywords/Common_Keywords.robot

*** Variables ***
${id}    ajayraut032@gmail.com
${pass}    Ajay@1998
${url}    https://www.facebook.com/

*** Keywords ***
Login Page
    

*** Test Cases ***

TC_01_Login Page
    Open Browser    ${url}                                                              # Open Browser with the Link
    Input Text     //*[@placeholder="Email address or phone number"]     ${id}    #Input Text at locator 
    Input Text     //*[@placeholder="Password"]  ${pass}
    Click Element     //*[@name="login"]                                           # Click the Web Element                     
    Capture Page Screenshot                                                            #Take Screeshot
    sleep   5s
    Close Browser

TC_02_Order_Something
    Log To Console   ${CURDIR}${/}
    Log To Console   ${EXECDIR}
    Log To Console    ${ajay}
    Log To Console    ${TC_02.url}
    [Setup]   Log    Tc has started
    [Teardown]    Close Browser
    # Open Browser    https://www.saucedemo.com/    edge
    # # ${username}     Set Variable    standard_user
    # # ${password}     Set Variable    secret_sauce

    # Wait Until Element Is Visible    //*[@id="root"]/div[1]/div[1]
    # Input Text    //*[@data-test="username"]     ${TC_02.username}
    # Input Password    //*[@data-test="password"]    ${TC_02.password}
    # Click Button    //*[@value="Login"]
    
    Login Browser    ${TC_02.url}    ${TC_02.username}    ${TC_02.password}
                    
    @{list values}   Get Element Attribute    //*[@class="inventory_list"]/div
    FOR  ${Item}   IN   @{list values}
        log  ${Item}
        Click Element    ${Item}
        Exit For Loop
        Sleep  5s
    END
    # //*[@class="inventory_list"]/div[1]/div[2]/div[2]/button
    Sleep     5s
    Log     Log was Succsesfull 
