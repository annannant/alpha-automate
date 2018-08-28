*** Settings ***
Test Setup          Open eCom Web
Library           Selenium2Library
Library           String
Resource          ../KeyWords/promotion.robot

*** Variable ***
${BROWSER}                   chrome
${EXPECT_LOADTIME}           12s

*** Keyword ***

*** Test Cases ***
TC_PROMO_01
    [Tags]   every_no_maximum
    [Documentation]    BUYNOW_SUCCESS - every purchase, no maximum              Buy 3 Qty get 1 set, ทุกๆการซ์็อ, no maximum
    ${PRODUCT_UID}=         Convert To String        P1000885
    ${PROMOCODE}=           Convert To String        CONY
    ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้โปรโมชั่นโค้ด ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ Central Gift Voucher จำนวน 3 Set
    ${REMARK_REWARD}=       Convert To String        *** จำกัด 1 คน 1 สิทธิ์ <3

    Go to product and add to cart        ${PRODUCT_UID}         9
    Accept and Next
    Fill Shipping Form
    Fill promotion code and apply                         ${PROMOCODE}
    Display remark reward corectly                        ${REMARK_REWARD}
    Display reward text on checkout page corectly         ${EXPECT_REWARD}
    Checkout
    Display reward text on checkout payment corectly       ${PROMOCODE}      ${EXPECT_REWARD}
    Get purchase code and go to detail page  
    Display reward text on purchase page corectly          ${PROMOCODE}      ${EXPECT_REWARD}

TC_PROMO_02
    [Tags]   every_no_maximum
    [Documentation]      BUYNOW FAIL - cart items not match, every purchase, no maximum
    ${TEXT}=                Convert To String        รายการสินค้าไม่ตรงกับข้อกำหนดการใช้โปรโมชั่นโค้ดนี้
    ${PRODUCT_UID}=         Convert To String        P1000888
    ${PROMOCODE}=           Convert To String        CONY
    Go to product and add to cart        ${PRODUCT_UID}             1
    Accept and Next
    # Fill Shipping Form
    Fill promotion code and apply        ${PROMOCODE}
    Alert product not match

# ----------------------- maximum ---------------------
TC_PROMO_03
    [Tags]   every_no_maximum
    [Documentation]    BUYNOW_SUCCESS - every purchase, no maximum              Buy 3 Qty get 1 set, ทุกๆการซ์็อ, max 2
    ${PRODUCT_UID}=         Convert To String        P1000888
    ${PROMOCODE}=           Convert To String        CONY
    ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้โปรโมชั่นโค้ด ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ Central Gift Voucher จำนวน 2 Set

    Go to product and add to cart        ${PRODUCT_UID}         9
    Accept and Next
    Fill Shipping Form
    Fill promotion code and apply                         ${PROMOCODE}
    Display reward text on checkout page corectly         ${EXPECT_REWARD}
    Checkout
    Display reward text on checkout payment corectly       ${PROMOCODE}      ${EXPECT_REWARD}
    Get purchase code and go to detail page  
    Display reward text on purchase page corectly          ${PROMOCODE}      ${EXPECT_REWARD}

# ----------------------- minumum purchase ---------------------
TC_PROMO_04
    [Tags]   every_no_maximum
    [Documentation]    BUYNOW_SUCCESS - every purchase, no maximum              Buy 3 Qty get 1 set, ตั้งแต่ 3 ชิ้น
    ${PRODUCT_UID}=         Convert To String        P1000884
    ${PROMOCODE}=           Convert To String        CONY
    ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้โปรโมชั่นโค้ด ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ Central Gift Voucher จำนวน 1 Set
    ${REMARK_REWARD}=       Convert To String        *** จำกัด 1 คน 1 สิทธิ์ <3

    Go to product and add to cart                         ${PRODUCT_UID}         9
    Accept and Next
    Fill Shipping Form
    Fill promotion code and apply                         ${PROMOCODE}
    Display remark reward corectly                        ${REMARK_REWARD}
    Display reward text on checkout page corectly         ${EXPECT_REWARD}
    Checkout
    Display reward text on checkout payment corectly      ${PROMOCODE}      ${EXPECT_REWARD}
    Get purchase code and go to detail page  
    Display reward text on purchase page corectly         ${PROMOCODE}      ${EXPECT_REWARD}
