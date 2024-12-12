*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    d:/RPA2/PageObject/Locators/LoginPageLocators.robot
Resource    d:/RPA2/PageObject/Locators/SettingsCRMLocators.robot
Resource    d:/RPA2/PageObject/Locators/ObjectLocators.robot
Resource    d:/RPA2/PageObject/ActionFile/ActionLogin.robot


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

