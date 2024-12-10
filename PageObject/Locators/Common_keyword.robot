*** Settings ***
Resource    d:/RPA2/PageObject/Locators/SettingsCRMLocators.robot
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections


*** Variables ***
# Login Information
${urlLAB}           https://lab.connect247.vn/ucrm-ver3/settings
${email}            auto@basebs.com
${pwd}              12345678x@X

# Excel File
${ObjConfig}        Object Test.xlsx
${GroupName}        GroupName   
${SheetName1}       Group1
${SheetName2}       Group2
${SheetName3}       FieldContact


#Function Generate Data









