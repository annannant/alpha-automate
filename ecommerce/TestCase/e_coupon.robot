*** Settings ***
Test Setup          Open eCom Web
Library           Selenium2Library
Library           String
Resource          ../KeyWords/promotion.robot
# Resource          ../KeyWords/purchase_page.robot

*** Variable ***
${BROWSER}                   chrome
${EXPECT_LOADTIME}           12s
${DEL_CART_ITEM_1}               //*[@id="root"]/div/div/div/div/div[1]/div/div/div[1]/div[3]/div[1]/div/div[4]/div[3]/a
${DEL_CART_ITEM_2}               //*[@id="root"]/div/div/div/div/div[1]/div/div/div[1]/div[3]/div[2]/div/div[4]/div[3]/a
                
*** Keyword ***

*** Test Cases ***
TC_COUPON_01
    # [Tags]   case success
    [Documentation]    BUYNOW_SUCCESS - ซื้อ 2,000 ลด 1,000
    ${PRODUCT_UID}=           Convert To String        P1000888
    ${PRODUCT_UID_B}=         Convert To String        P1002623
    ${ECOUPON}=               Convert To String        ECLIVE
    ${DISCOUNT}=              Convert To String        -1,000.00

    Go to product and add to cart        ${PRODUCT_UID}           2
    Go to product and add to cart        ${PRODUCT_UID_B}         3
    Accept and Next
    Fill Shipping Form
    Fill e-coupon code and apply         ${ECOUPON}
    Display e-coupon discount on checkout page correctly      ${ECOUPON}        ฿${DISCOUNT}
    Checkout
    Display e-coupon discount on payment page correctly       ${ECOUPON}        ฿${DISCOUNT} 
    Get purchase code and go to detail page  
    Display coupon and discount on purchase         ${ECOUPON}        ${DISCOUNT}

TC_COUPON_01_01
    # [Tags]   case success
    [Documentation]    SURVEY_SUCCESS - ซื้อ 1,000 ลด 100
    ${PRODUCT_UID}=           Convert To String        P1009024
    ${ECOUPON}=               Convert To String        ECSURVEY
    ${DISCOUNT}=              Convert To String        -100.00

    Go to product and add to survey        ${PRODUCT_UID}
    Accept and Next
    Fill Survey Shipping Form
    # Fill Shipping Form
    Fill e-coupon code and apply         ${ECOUPON}
    Display e-coupon discount on checkout page correctly      ${ECOUPON}        ฿${DISCOUNT}
    Checkout
    Display e-coupon discount on payment page correctly       ${ECOUPON}        ฿${DISCOUNT} 
    Get purchase code and go to detail page  
    Display coupon and discount on purchase                   ${ECOUPON}        ${DISCOUNT}

TC_COUPON_01_02
    # [Tags]   case success
    [Documentation]    REQ2BUY_SUCCESS - ซื้อ 1,000 ลด 100
    ${PRODUCT_UID}=           Convert To String        P1000069
    ${ECOUPON}=               Convert To String        ECLIVE
    ${DISCOUNT}=              Convert To String        -1,000.00

    Go to product and add to req2buy      ${PRODUCT_UID}
    Accept and Next
    Fill Customer Form
    Fill e-coupon code and apply          ${ECOUPON}
    Display e-coupon desc and remark on checkout page correctly      ${ECOUPON}    ${DISCOUNT}
    Next Step
    Display one next btn
    Display e-coupon desc and remark on checkout page correctly      ${ECOUPON}    ${DISCOUNT}
    Checkout req2buy
    Get purchase code and go to detail page  
    Display coupon and discount on purchase                   ${ECOUPON}        0.00

TC_COUPON_02
    # [Tags]   valid case
    [Documentation]    BUYNOW - Apply coupon -> edit cart -> checkout -> expected "no coupon"
    ${PRODUCT_UID}=           Convert To String        P1000888
    ${PRODUCT_UID_B}=         Convert To String        P1002623
    ${ECOUPON}=               Convert To String        ECLIVE
    ${DISCOUNT}=              Convert To String        -1,000.00

    Go to product and add to cart        ${PRODUCT_UID}           2
    Go to product and add to cart        ${PRODUCT_UID_B}         3
    Accept and Next
    Fill e-coupon code and apply         ${ECOUPON}
    Display e-coupon discount on checkout page correctly      ${ECOUPON}        ฿${DISCOUNT}
    Go To                                ${STORE_URL}/cart
    Wait Until Element Is Visible        ${DEL_CART_ITEM_1}
    Click Element                        ${DEL_CART_ITEM_1}
    Wait Until Element Is Visible        ${DEL_CART_ITEM_1}
    Click Element                        ${DEL_CART_ITEM_1}
    Go to product and add to cart        ${PRODUCT_UID_B}         4
    Fill Shipping Form
    Checkout
    Get purchase code and go to detail page  
    Does't have coupon and discount on purchase       ${ECOUPON}        ${DISCOUNT}

TC_COUPON_03
    [Tags]   all_invalid_case
    [Documentation]    BUYNOW - BUYNOW_SUCCESS - ซื้อ 2,000 ลด 1,000
    ${PRODUCT_UID}=    Convert To String        P1000888
    ${DISCOUNT}=       Convert To String        -1,000.00
    ${ECOUPON}=        Convert To String        ECLIVE
    Go to product and add to cart        ${PRODUCT_UID}           1
    Accept and Next
    Fill e-coupon code and apply         ${ECOUPON}
    Alert product not match with coupon   
    Ok, I see

    ${ECOUPON}=   Convert To String      INVALID
    Go to product and add to cart        ${PRODUCT_UID}           5
    Fill e-coupon code and apply         ${ECOUPON}
    Alert no coupon
    Ok, I see
    Sleep         2s

    ${ECOUPON}=   Convert To String      ECLIVE
    Fill e-coupon code and apply         ${ECOUPON}
    Display e-coupon discount on checkout page correctly      ${ECOUPON}        ฿${DISCOUNT}
    Reload Page
    Sleep         2s

    Fill Shipping Form
    
    ${ECOUPON}=   Convert To String      ECEXPIRED
    Fill e-coupon code                   ${ECOUPON}   
    Next Step
    Alert confirm to use coupon 
    Ok, I see
    Sleep         2s
    Fill e-coupon code and apply         ${ECOUPON}
    Alert coupon expired
    Ok, I see
    Sleep         2s

    Checkout
    Get purchase code and go to detail page  
    Does't have coupon and discount on purchase       ${ECOUPON}        ${DISCOUNT}
    