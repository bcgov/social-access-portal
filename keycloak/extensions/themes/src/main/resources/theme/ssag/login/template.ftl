<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(client.getDescription()!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
  <div class="ssag-header">
      <div class="ssag-logo-wrapper">
          <img class ="ssag-logo" src="${url.resourcesPath}/img/logo-banner.svg" alt="BC Gov logo"/>
      </div>
      <div class="ssag-title-wrapper" >
          <div class="ssag-bottom-title" >
              ${client.getDescription()!""}
          </div>
      </div>  
  </div>
  <div class="ssag-page">
    <div>
      <h3 class="ssag-title">Log in to ${client.getDescription()!''}</h3>
    </div>
    <div class="ssag-login ssag-card">
      <div class="ssag-container">
        <p class="ssag-subheader">Please select your preferred login method</p>
        <#nested "socialProviders">
      </div>
    </div>
  </div>
  <footer class="ssag-footer">
        <div class="ssag-footer-elements">
            <p class="links">Version 1.1.2</p>
            <p class="divider">|</p>
            <p class="links">Home</p>
            <p class="divider">|</p>
            <p class="links">Disclaimer</p>
            <p class="divider">|</p>
            <p class="links">Privacy</p>
            <p class="divider">|</p>
            <p class="links">Collection of Information</p>
            <p class="divider">|</p>
            <p class="links">Terms of Use</p>
            <p class="divider">|</p>
            <p class="links">Accesibility</p>
            <p class="divider">|</p>
            <p class="links">Copyright</p>
            <p class="divider">|</p>
            <p class="links">Contact Us</p>
        </div>
    </footer>
</body>
</html>
</#macro>
