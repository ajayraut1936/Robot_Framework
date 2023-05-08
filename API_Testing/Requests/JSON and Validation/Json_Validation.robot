*** Settings ***
Library     Collections
Library     OS
Library     JSONLibrary

*** Variables ***

*** Test Cases ***
TC_001:
#    ${Json_obj}=    'load json from file'   C:/Users/erauaja/PycharmProjects/API_Testing/Requests/JSON and Validation/Jsondata.txt
#    ${name}=    'get value from json'       ${Json_obj}         $.firstName
    log     ${name}