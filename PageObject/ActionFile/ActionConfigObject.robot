*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ./PageObject/Locators/LoginPageLocators.robot
Resource    ./PageObject/Locators/SettingsCRMLocators.robot
Resource    ./PageObject/Locators/ObjectLocators.robot
Resource    ./PageObject/ActionFile/ActionLogin.robot


*** Tasks ***
Add Object To Frist Group
    Open CRM
    Login CRM
    Sleep    2s
    Click ObjectManagement
    Add Object To Frist Group

Add Object
    Open CRM
    Login CRM
    Sleep    2s
    Click ObjectManagement
    AddGroup
    # CreateNewOBj4thGroup
    Add Object To New Fourth Group

