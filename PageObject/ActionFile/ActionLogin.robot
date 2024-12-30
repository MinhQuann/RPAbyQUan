*** Settings ***
Resource    PageObject/Locators/LoginPageLocators.robot
Resource    PageObject/Locators/Common_keyword.robot


*** Keywords ***
Login
    Open CRM
    Login CRM
    Sleep    2s

