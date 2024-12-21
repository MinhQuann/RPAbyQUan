*** Settings ***
Resource    d:/RPA2/PageObject/Locators/LoginPageLocators.robot
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot


*** Keywords ***
Login
    Open CRM
    Login CRM
    Sleep    2s

