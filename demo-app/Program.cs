using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.CookiePolicy;

// Config variables
var keycloakAuthority = Environment.GetEnvironmentVariable("KEYCLOAK_AUTHORITY");
var keycloakClientId = Environment.GetEnvironmentVariable("KEYCLOAK_CLIENT_ID");
var keycloakClientSecret = Environment.GetEnvironmentVariable("KEYCLOAK_CLIENT_SECRET");

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();


builder.Services.AddAuthentication(options => 
{
    // Store the session to cookies
    options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    // OpenId authentication
    options.DefaultChallengeScheme = OpenIdConnectDefaults.AuthenticationScheme;
})
    .AddCookie(options =>
         {
             options.LoginPath = "";
             options.LogoutPath = "/logout";
         })
    .AddOpenIdConnect(options =>
    {
        // URL of the Keycloak server
        options.Authority = keycloakAuthority;
        // Client configured in the Keycloak
        options.ClientId = keycloakClientId;
        
        // For testing we disable https (should be true for production)
        options.RequireHttpsMetadata = false;
        options.SaveTokens = true;
        // Client secret shared with Keycloak
        options.ClientSecret = keycloakClientSecret;
        options.GetClaimsFromUserInfoEndpoint = true;

        // OpenID flow to use
        options.ResponseType = OpenIdConnectResponseType.CodeIdToken;
        options.NonceCookie.SameSite = SameSiteMode.Unspecified;
        options.CorrelationCookie.SameSite = SameSiteMode.Unspecified;
    }); 


var app = builder.Build();



// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseAuthentication();

// app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseCookiePolicy(new CookiePolicyOptions()
{
    HttpOnly = HttpOnlyPolicy.Always,
    Secure = CookieSecurePolicy.Always,
    MinimumSameSitePolicy = SameSiteMode.None
});

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run("http://0.0.0.0:7170");
