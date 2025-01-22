*** Settings ***
Resource    Common_keyword.robot
Resource    SettingsCRMLocators.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     RPA.Windows


*** Variables ***
${AddSection}               //*[@id="root"]/section/section/section/main/div/div[1]/div[2]/button
${btnAddFieldSec1}          //*[@id="root"]/section/section/section/main/div/div[3]/div/div/div/div[2]/div/div/button
${ChooseObject}             id:UCRM-fields-management-select-object
${AddFieldSection1}         id:UCRM-fields-management-add-new-field-0
${AddFieldSection2}         id:UCRM-fields-management-add-new-field-1

# Config Field Type text
${Type}                     //*[@id="basic"]/div[1]/div/div[2]/div/div/div/div/span[2]
${FieldName}                id:basic_name
${Required}                 id:basic_required
${SoftRequired}             id:basic_soft_required
${MassEdit}                 id:basic_mass_edit
${ReadOnly}                 id:basic_readonly
${Encryption}               id:basic_encrypted

# Config Field Type Textarea
${MaxLength}                id:basic_max_length
${Rows}                     id:basic_rows
${isEditor}                 id:basic_is_editor

# Config Field Type Number
${Step}                     id:basic_step
${DecimalPlaces}            id:basic_decimal_separator
${Options}                  //*[@id="basic"]/div[9]/div/div[2]/div/div/div/div/div
${DefaultValue}             id:basic_default_value

# Config Field Type Select
${OptionSelect}             //*[@id="basic"]/div[6]/div/div[2]/div/div/span
${Multiple}                 id:basic_multiple
${DefaultValueSelect}       id:basic_default_value

# Config Field Type Droplist
${Droplist}                 id:basic_droplist_id

# Config Field Type Linking ObjectPageObject/Locators/FieldManagementLocators.robot
${ObjectName}               id:basic_objectname
${FieldLinking}             //*[@id="basic"]/div[7]/div/div[2]/div/div/div/div/span[2]

# Config Field Type Dynamic Field
${OptionDynamicField}       //*[@id="basic"]/div[7]/div/div[2]/div/div/span

# Config Field Type Formula Field
${FormulaType}              id:basic_formula_type
${Formula}                  //*[@id="basic"]/div[7]/div/div[2]/div/div/div/div/div


*** Keywords ***
SelectObject
    [Arguments]    ${object}
    RPA.Browser.Selenium.Input Text    ${ChooseObject}    ${object}

AddSection
    RPA.Browser.Selenium.Click Element    ${AddSection}

AddFieldToSection2ofObjContact
    SelectObject    Contact
    AddSection
    RPA.Browser.Selenium.Click Element    ${AddFieldSection2}
    Sleep    2s
    Open Workbook    ${ObjConfig}
    ${rows}    Read Worksheet As Table    header=True    name=${SheetName1}
    FOR    ${row}    IN    @{rows}
        ${row}    Get From Dictionary    ${row}    FieldName
    END
