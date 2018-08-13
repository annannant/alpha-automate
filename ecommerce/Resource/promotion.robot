*** variable ***
${STORE_URL}                https://store.alphaem-dev.com
# ${STORE_URL}                http://localhost:3000
${URL_WEB}                  ${STORE_URL}/?key=dogPzIz8
${qty}                      //*[@id="root"]/div/div/div/div[1]/div[1]/div[2]/div/form/div[6]/div/div[1]/span/input
${btn_add_to_cart}          //button[contains(text(),'เพิ่มในรถเข็น')]
${btn_add_to_cart}          //button[contains(text(),'เพิ่มในรถเข็น')]
${btn_add_to_survey}        //button[contains(text(),'ชำระค่าสำรวจ')]
${btn_add_to_req2buy}       //button[contains(text(),'ขอใบเสนอราคา')]
${btn_next}                 //*[@id="NextBtn"]
${btn_back_to_shop}         //*[@id="BackToShoppingBtn"]
${btn_payment}              //button[contains(text(), '฿ ชำระเงิน')]
${btn_accept}               //*[@id="btn-accept"]
${chk_accept}               //label[@for="chk-accept-top"]
${input_qty}                //*[@id="root"]/div/div/div/div[1]/div[1]/div[2]/div/form/div[6]/div/div[1]/span/input
${loader}                   //*[@class="loader"]

${co_name}                  //input[@id="name"]
${co_phone}                 //input[@id="phone-number"]
${co_email}                 //input[@id="email"]
${co_changeAddress}         //*[@id="changeAddress"]
${co_address_subdistrict}   //*[@id="address_subdistrict"]
${co_promocode}             //input[@id="PromotionCodeText"]
${co_apply_code}            //button[@id="ApplyPromotionCodeBtn"]
${co_reward}                //div[@id='Reward']
${co_remark_reward}         //div[@id='RemarkReward']

${thk_promocode_text1}         //*[@id='PromotioncodeText1']
${thk_promocode_text2}         //*[@id='PromotioncodeText2']

${survey_changeAddress}         //*[@id="address"]
${survey_address_subdistrict}   //*[@id="suyvey_subdistrict"]

${swal}                     //div[@class="swal2-modal swal2-show"]
${swal_code_not_found}      //h2[contains(text(), 'ไม่พบข้อมูลโปรโมชั่น')]
${use_this_code}            //button[@class="swal2-confirm swal2-styled"]
${swal_confirm}             //button[@class="swal2-confirm swal2-styled"]
${swal_cancel}              //button[@class="swal2-cancel swal2-styled"]
${remove_reward}            //div[@class="form-horizontal show-on-desktop-only"]//div[@id="RemoveRewardBtn"]
${for_code}                 //div[contains(text(), 'สำหรับโปรโมชั่นโค้ด')]
${for_code2}                //div[contains(text(), 'ทางบริษัทฯ จะทำการตรวจสอบ หากเป็นไปตามเงื่อนไข ของสมนาคุณจะถูกจัดส่งให้ท่านภายใน 30 วันทำการหลังจบกิจกรรม')]

${payment_promo_code}       //span[@id="PromotionCode"]
${payment_reward_text}      //span[@id="RewardText"]

${admin_username}           //*[@id="root"]/div/div/div/div/div[2]/div[1]/input
${admin_password}           //*[@id="root"]/div/div/div/div/div[2]/div[2]/input

${save_promotion}           //button[contains(text(), 'Save')]
${every_radio}              //*[@id="EveryPurchaseRadio"]
${minimum_radio}            //*[@id="MinimumPurchaseRadio"]
${maximum_reward_text}      //*[@id="MaximumRewardAmount"]
