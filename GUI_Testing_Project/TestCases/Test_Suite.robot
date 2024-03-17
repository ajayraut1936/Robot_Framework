*** Settings ***
Library    SeleniumLibrary

Variables   ../Resourses/Suite.yaml
Resource    ../Keywords/Common_Keywords.robot

*** Variables ***

*** Test Cases ***

TC_01 Framwork 
    Login Browser    ${TC_02.url}    ${TC_02.username}   ${TC_02.password}
    Sleep  3s
    Close Browser
