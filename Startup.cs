using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Dummy.Data;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using EntidadTestClient;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Authentication;
using IdentityModel;
using IdentityServer4.Validation;
using IdentityServer4.Configuration;
using IdentityServer4.Models;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.IdentityModel.Logging;
using IdentityServer4;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;

namespace Dummy
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddTransient<CookieEventHandler>();
            //services.AddSingleton<LogoutSessionManager>();

            IdentityModelEventSource.ShowPII = true;

            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseNpgsql(
                    Configuration.GetConnectionString("DefaultConnection")));
            services.AddIdentity<IdentityUser, IdentityRole>(
             config =>
             {
                 config.SignIn.RequireConfirmedEmail = true;
             }
             )
             .AddEntityFrameworkStores<ApplicationDbContext>();
            services.AddControllersWithViews().
  SetCompatibilityVersion(CompatibilityVersion.Version_3_0);

            services.AddRazorPages(/*options =>
        {
            options.Conventions.AddFolderApplicationModelConvention(
                "/Pages",
                model => model.Filters.Add(new PageSecurityFilter()));
        }*/);

            //services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);


            services.AddAntiforgery(options =>
            {
                // new API
                options.Cookie.Name = ".AntiforgeryCookie";
                //  options.Cookie.Domain = "contoso.com";
                //  options.Cookie.Path = "/";
                options.Cookie.SecurePolicy = CookieSecurePolicy.Always;
            });

            services.AddHttpClient();


            services.Configure<AuthConfiguration>(Configuration.GetSection("AuthConfiguration"));

            var authConfiguration = Configuration.GetSection("AuthConfiguration");
            var clientId_aud = authConfiguration["Audience"];

            services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = $"/Login2";
                options.Cookie.Name = "EntidadCookie";
                options.SlidingExpiration = true;
                int val = int.Parse(Configuration["ServerSettings:CookieLifetime"]);
                options.ExpireTimeSpan = TimeSpan.FromMinutes(val);
            });


            services.AddAuthentication(options =>
            {
                options.DefaultScheme = "cookie";
                options.DefaultChallengeScheme = "oidc";
            })
             .AddCookie(options =>
             {
                 options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
                 options.Cookie.Name = "cookie";
                 options.EventsType = typeof(CookieEventHandler);
             })
             .AddOpenIdConnect("oidc", options =>
             {
                 options.Authority = authConfiguration["StsServerIdentityUrl"];
                 options.RequireHttpsMetadata = false;

                 options.UsePkce= true;
                 //options.ClientSecret = Configuration["ClientSecret"]; ;
                 options.ClientId = clientId_aud;

                 options.ResponseType = "code ";

                 options.Scope.Clear();
                 options.Scope.Add("openid");
                 options.Scope.Add("profile");
                 options.Scope.Add("co_scope");

                 options.ClaimActions.Remove("amr");
                 options.ClaimActions.MapJsonKey("website", "website");

                 options.GetClaimsFromUserInfoEndpoint = true;
                 options.SaveTokens = true;


                 options.TokenValidationParameters = new TokenValidationParameters
                 {
                     ValidateIssuer = true
                 };

                 // Callbacks for middleware to properly correlate
                 options.CallbackPath = new PathString("/signin-oidc");
                 options.SignedOutRedirectUri = new PathString("/Login2"); //en esta pagina se muestra LoggedOut cuando esta autenticado
                 options.SignedOutCallbackPath = "/signout-callback-oidc";



                 options.SignInScheme = IdentityServerConstants.ExternalCookieAuthenticationScheme;

                 options.TokenValidationParameters = new TokenValidationParameters
                 {
                     NameClaimType = JwtClaimTypes.Name,
                     RoleClaimType = JwtClaimTypes.Role,
                 };


                 options.ClaimActions.MapAllExcept("iss", "nbf", "exp", "aud", "nonce", "iat", "c_hash");
                 options.Events = new OpenIdConnectEvents
                 {

                     OnRemoteFailure = (context) =>
                     {
                          context.Response.Redirect("/Login2");
                         context.HandleResponse();

                         return Task.CompletedTask;
                     },
                     OnRedirectToIdentityProviderForSignOut = context =>
                     {
                         var authenticateInfo =  context.Properties.GetTokenValue("id_token");

                         var idToken =  context.HttpContext.GetTokenAsync("id_token");
                         
                         if (idToken.Result!= null && !context.Properties.Items.ContainsKey("id_token_hint"))
                             context.ProtocolMessage.SetParameter("id_token_hint", idToken.Result);
                         context.ProtocolMessage.IdToken = idToken.Result;
                         return Task.FromResult(0);
                     },
                     OnRedirectToIdentityProvider = context =>
                     {

                         if (context.Properties.Items.ContainsKey("acr_values"))
                             context.ProtocolMessage.SetParameter("acr_values", context.Properties.Items["acr_values"]);
                         if (context.Properties.Items.ContainsKey("login_hint"))
                             context.ProtocolMessage.SetParameter("login_hint", context.Properties.Items["login_hint"]);

                         return Task.FromResult(0);
                     }
                 };

             });

    
            services.AddTransient<IdentityServerOptions>();

            services.AddIdentityServer().AddInMemoryClients(new List<Client>() { }).AddInMemoryIdentityResources(new List<IdentityResource>() { });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                //app.UseDatabaseErrorPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();
            

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapRazorPages();
                endpoints.MapDefaultControllerRoute();
            });
        }
    }
}
