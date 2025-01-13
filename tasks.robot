*** Settings ***
Resource    PageObject/Locators/Common_keyword.robot
Resource    PageObject/Locators/LoginPageLocators.robot
Resource    PageObject/Locators/CallCenterLocator.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     DateTime


*** Test Cases ***
test 1
    How Many User Login And Call API    0    19

test 2
    How Many User Login And Call API    1    19

test 3
    How Many User Login And Call API    2    19

test 4
    How Many User Login And Call API    3    19

test 5
    How Many User Login And Call API    4    19

test 6
    How Many User Login And Call API    5    19

test 7
    How Many User Login And Call API    6    19

test 8
    How Many User Login And Call API    7    19

test 9
    How Many User Login And Call API    8    19

test 19
    How Many User Login And Call API    9    19

test 11
    How Many User Login And Call API    19    19

test 12
    How Many User Login And Call API    11    19

test 13
    How Many User Login And Call API    12    19

test 14
    How Many User Login And Call API    13    19

test 15
    How Many User Login And Call API    14    19

test 16
    How Many User Login And Call API    15    19

test 17
    How Many User Login And Call API    16    19

test 18
    How Many User Login And Call API    17    19

test 19
    How Many User Login And Call API    18    19

test 20
    How Many User Login And Call API    19    19
