*** Settings ***
Resource    ./PageObject/Locators/Common_keyword.robot
Resource    ./PageObject/Locators/LoginPageLocators.robot
Resource    ./PageObject/Locators/CallCenterLocator.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     DateTime


*** Tasks ***
Create Data CDP
    Open CRM CDP
    FOR    ${i}    IN    100000
        RPA.Browser.Selenium.Wait Until Element Is Visible    (//button[@type='button'])[1]
        RPA.Browser.Selenium.Click Element    (//button[@type='button'])[1]
        RPA.Browser.Selenium.
    END
