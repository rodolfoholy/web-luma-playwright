*** Settings ***
Resource        ../main.robot

Suite Setup     Open The Test Browser
Test Setup      Back to main page
Suite Teardown  Close Browser

*** Test Cases ***
#
#   In these test cases, we assume as a precondition that we have a previously created test data set of a purchase receipt.
#

Fill the form with valid informations using Zip Code
    [Tags]    valid_zip_code

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form with valid information using Zip Code
    Then the user will see the Order Details page with valid informations about the Order

Fill the form with valid informations using E-mail
    [Tags]    valid_email

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form with valid information using Email
    Then the user will see the Order Details page with valid informations about the Order

Fill the form with valid informations using Zip Code but selecting E-mail on the Find Order By field
    [Tags]    valid_zip_code_but_select_email

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form using valid Zip Code but select Email
    Then the user will see a error about incorrect Email below the Email field

Fill the form with valid informations using E-mail but selecting Zip Code on the Find Order By field
    [Tags]    valid_email_but_select_zip_code

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form using valid Email but select Zip Code
    Then the user will see a error about incorrect data above the form

Fill the form with valid informations but the Order Id will be incomplete
    [Tags]    incomplete_order_id

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form with incomplete Order ID
    Then the user will see a error about incorrect data above the form

Fill the form with a invalid Order ID
    [Tags]    invalid_order_id

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form with invalid Order ID
    Then the user will see a error about incorrect data above the form

Fill the form with a invalid Billing Last Name
    [Tags]    invalid_billing_last_name
    
    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form with invalid Billing Last Name
    Then the user will see a error about incorrect data above the form

Fill the form with a invalid Zip Code
    [Tags]    invalid_zip_code

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form with invalid Zip Code
    Then the user will see a error about incorrect data above the form

Fill the form with a invalid E-mail
    [Tags]    invalid_email

    Given the user will open the main page and scroll down to the Orders and Returns link
    When the user fill the form with invalid Email
    Then the user will see a error about incorrect Email below the Email field