<#import "template.ftl" as layout>
<#import "register-commons.ftl" as registerCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm','termsAccepted'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('role',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.role" class="${properties.kcLabelClass!}">${msg("Role")}</label>
                </div>
                <div id="switch-container" class="${properties.kcInputWrapperClass!}">
                    <input
                        type="text"
                        id="user.attributes.role"
                        class="${properties.kcInputClass!}"
                        name="user.attributes.role"
                        value="${(register.formData['user.attributes.role']!'')}"
                        style="display:none;"
                    />
                    <button class="pf-c-button pf-m-secondary active" type="button">
                        <svg height="20" version="1.1" viewBox="0 0 24 20" width="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><title>4A9B4DE3-B583-42D6-BB26-616CB59032D2navy</title><g fill="none" fill-rule="evenodd" id="UI/UX-Guidelines" stroke="none" stroke-width="1"><g id="Tokens/Icons" transform="translate(-654.000000, -395.000000)"><g id="Group-5" transform="translate(654.000000, 395.000000)"><polygon id="Stroke-1" points="0 0 23.999999 0 23.999999 23.999999 0 23.999999" stroke="#000000" stroke-opacity="0.0117647061" stroke-width="1.33333336e-11"></polygon><path d="M6.99999976,12.9999996 C8.65999928,12.9999996 9.99999976,11.6599991 9.99999976,9.99999958 C9.99999976,8.3399997 8.65999928,6.99999958 6.99999976,6.99999958 C5.33999988,6.99999958 3.99999976,8.3399997 3.99999976,9.99999958 C3.99999976,11.6599991 5.33999988,12.9999996 6.99999976,12.9999996 Z M18.9999999,6.9999997 L10.9999999,6.9999997 L10.9999999,13.9999997 L2.99999994,13.9999997 L2.99999994,4.9999997 L0.99999994,4.9999997 L0.99999994,19.9999997 L2.99999994,19.9999997 L2.99999994,16.9999997 L20.9999999,16.9999997 L20.9999999,19.9999997 L22.9999999,19.9999997 L22.9999999,10.9999997 C22.9999999,8.78999947 21.2099977,6.9999997 18.9999999,6.9999997 Z" fill="currentColor" id="Fill-3"></path></g></g></g></svg>
                        Supplier
                    </button>
                    <button class="pf-c-button pf-m-secondary" type="button">
                        <svg fill="currentColor" height="20" viewBox="0 0 20 20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M5.352 19.398h2l4.488-8H17s3 0 3-1.398-3-1.398-3-1.398h-5.16l-4.488-8h-2l2.488 8H4.25L2 6.598H0L1.602 10 0 13.398h2l2.25-2h3.59zm0 0"></path></svg>
                        Buyer
                    </button>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"
                           value="${(register.formData.firstName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('firstName')>
                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                           value="${(register.formData.lastName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('lastName')>
                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />

                    <#if messagesPerField.existsError('email')>
                        <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="${properties.kcInputGroup!}">
                            <input type="password" id="password" class="${properties.kcInputClass!}" name="password"
                                   autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                            />
                            <button class="pf-c-button pf-m-control" type="button" aria-label="${msg('showPassword')}"
                                    aria-controls="password"  data-password-toggle
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </button>
                        </div>


                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm"
                               class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="${properties.kcInputGroup!}">
                            <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
                                   name="password-confirm"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            />
                            <button class="pf-c-button pf-m-control" type="button" aria-label="${msg('showPassword')}"
                                    aria-controls="password-confirm"  data-password-toggle
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </button>
                        </div>

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <@registerCommons.termsAcceptance/>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
        <script>
            document.getElementById('switch-container').addEventListener('click', function(event) {
                if (event.target.classList.contains('pf-c-button')) {
                    document.querySelector('.active').classList.remove('active');
                    event.target.classList.add('active');
                    document.querySelector('[id="user.attributes.role"]').value = event.target.innerText;
                }
            });
        </script>
        <style>
            #switch-container {
                display: flex;
                gap: 16px;
            }
            #switch-container .pf-c-button {
                font-size: 14px;
                --pf-c-button--m-secondary--after--BorderColor: rgb(255,255,255);
                width: 100%;
                padding: 12px 10px;
                border-radius: 4px;
                border: 1px solid #eaeaea;
                background-color: #fff;
                color: #717171;
                cursor: pointer;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 8px;
            }
            #switch-container .pf-c-button.active {
                --pf-c-button--m-secondary--after--BorderColor: #0265fe;
                background-color: #fff;
                color: #0265fe;
            }
        </style>
    </#if>
</@layout.registrationLayout>
