*** Settings ***
Resource    ../Auto-Keywords/Assets/RobotImports/Import_Global.robot
Test Setup         Navigate To LoginScreen
Test Teardown     CLOSE ALL BROWSERS

*** Test Cases ***
TC-4 verify user can purchase product
    [Tags]      REG  SANITY
    Enter valid user credentials
    Login To Website
    Sort items by price in accending order
    select the product and add to cart
    Open Cart
    verify name and price of Item added to cart
    move to product checkout
    fill in details for check out
    Continue to review purchase items
    finish puchase
    confirm purchase

TC-5 verify purchase can be cancelled
     [Tags]      REG
    Enter valid user credentials
    Login To Website
    Sort items by price in accending order
    select the product and add to cart
    Open Cart
    verify name and price of Item added to cart
    move to product checkout
    fill in details for check out
    Continue to review purchase items
    Cancel purchase
    Open Cart
    Remove products from cart

TC-6 Verify user can add all products to cart and remove them
    [Tags]      REG
    Enter valid user credentials
    Login To Website
    add all products to cart
    Open Cart
    Remove products from cart
