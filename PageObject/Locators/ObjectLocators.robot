*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Resource    d:/RPA2/PageObject/Locators/SettingsCRMLocators.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections


*** Variables ***
# Add Group
${AddGroup}                     //*[@id="root"]/section/section/section/main/div/div[2]/button
${GroupName1}                   //*[@id="basic_groupName"]
${btnSaveGroup}                 //*[@id="basic"]/div[2]/button[1]

# Add Object
${CreateNewOBj4thGroup}         //*[@id="root"]/section/section/section/main/div/div[3]/div/div[4]/div[2]/div[1]/button
${CreateObjectfrom1stGroup}     //*[@id="root"]/section/section/section/main/div/div[3]/div/div[1]/div[2]/div[2]
${CreateObjectfrom2ndGroup}     //*[@id="root"]/section/section/section/main/div/div[3]/div/div[2]/div[2]/div[2]
${CreateObjectfrom3rdGroup}     ${EMPTY}
${CreateObjectfrom4thGroup}     //*[@id="root"]/section/section/section/main/div/div[3]/div/div[4]/div[2]/div[2]
${objName}                      id:basic_objectName
${LabelIDName1}                 id:basic_labelIDName
${Prefix1}                      id:basic_prefix
${StartSequence1}               id:basic_startSequence
${SaveLog}                      (//*[@id="basic"]/div[9]/label/span[1]/input)[1]
${btnSaveObject}                (//*[@id="basic"]/div[10]/button[1])[1]
${btnCloseObject}               (//*[@id="basic"]/div[10]/button[2])[1]


*** Keywords ***
AddGroup
    Open Workbook    ${ObjConfig}
    ${rows}    Read Worksheet As Table    header=True    name=${GroupName}
    FOR    ${row}    IN    @{rows}
        Log To Console    message: ${row}
        ${GroupName}    Get From Dictionary    ${row}    GroupName
        Sleep    2s
        RPA.Browser.Selenium.Click Element    ${AddGroup}
        RPA.Browser.Selenium.Input Text    ${GroupName1}    ${GroupName}
        RPA.Browser.Selenium.Click Element    ${btnSaveGroup}
    END

Add Object To Frist Group
    Open Workbook    ${ObjConfig}
    ${rows}    Read Worksheet As Table    header=True    name=${SheetName1}
    FOR    ${row}    IN    @{rows}
        Log To Console    message: ${row}
        ${ObjectName}    Get From Dictionary    ${row}    ObjectName
        ${LabelIDName}    Get From Dictionary    ${row}    LabelIDName
        ${Prefix}    Get From Dictionary    ${row}    Prefix
        ${StartSequence}    Get From Dictionary    ${row}    Sequence
        Sleep    2s
        RPA.Browser.Selenium.Click Element    ${CreateObjectfrom1stGroup}
        RPA.Browser.Selenium.Input Text    ${objName}    ${ObjectName}
        RPA.Browser.Selenium.Input Text    ${LabelIDName1}    ${LabelIDName}
        RPA.Browser.Selenium.Input Text    ${Prefix1}    ${Prefix}
        RPA.Browser.Selenium.Input Text    ${StartSequence1}    ${StartSequence}

        RPA.Browser.Selenium.Click Element    ${btnSaveObject}
    END

Add Object To New Fourth Group
    Open Workbook    ${ObjConfig}
    ${rows}    Read Worksheet As Table    header=True    name=${SheetName2}
    ${first_appearance}    Set Variable    False
    FOR    ${row}    IN    @{rows}
        Log To Console    message: ${row}

        ${ObjectName}    Get From Dictionary    ${row}    ObjectName
        ${LabelIDName}    Get From Dictionary    ${row}    LabelIDName
        ${Prefix}    Get From Dictionary    ${row}    Prefix
        ${StartSequence}    Get From Dictionary    ${row}    Sequence

        Sleep    2s

        IF    not ${first_appearance}
            RPA.Browser.Selenium.Wait Until Element Is Visible    ${CreateNewOBj4thGroup}
            RPA.Browser.Selenium.Click Element    ${CreateNewOBj4thGroup}
            ${first_appearance}    Set Variable    True
        END

        RPA.Browser.Selenium.Input Text    ${objName}    ${ObjectName}
        RPA.Browser.Selenium.Input Text    ${LabelIDName1}    ${LabelIDName}
        RPA.Browser.Selenium.Input Text    ${Prefix1}    ${Prefix}
        RPA.Browser.Selenium.Input Text    ${StartSequence1}    ${StartSequence}

        RPA.Browser.Selenium.Click Element    ${btnSaveObject}

        IF    '${first_appearance}' == 'True'
            RPA.Browser.Selenium.Wait Until Element Is Visible    ${CreateObjectfrom4thGroup}
            RPA.Browser.Selenium.Scroll Element Into View    ${CreateObjectfrom4thGroup}
            Sleep    1s
            RPA.Browser.Selenium.Click Element    ${CreateObjectfrom4thGroup}
        END
    END
