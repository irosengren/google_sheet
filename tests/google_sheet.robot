*** Settings ***
Library              RPA.Cloud.Google
Library              QWeb
Suite Setup          OpenBrowser                 http://google.com           chrome

*** Variables ***
${SPREADSHEET_ID}    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX            #add your google sheet id here
${path_json}         ../xxxxxxxxxxxxxxxxxxxxxxxxxxx              #add your json file name and path to file here


*** Tasks ***
Init Google services
    Init Drive       ${path_json}
    ${file_dict}=    Get Drive File By ID        file_id=${SPREADSHEET_ID}
    Init Sheets      ${path_json}

    ${values}=       Get Sheet Values            ${SPREADSHEET_ID}           A2:E2

    ${row}           Evaluate                    [["Ellen"]]
    ${result}=       Update Sheet Values
    ...              ${SPREADSHEET_ID}
    ...              A2
    ...              ${row}

    ${values}=       Get Sheet Values            ${SPREADSHEET_ID}           A2

