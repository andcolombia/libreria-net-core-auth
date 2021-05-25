using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace EntidadClient.Pages
{
    [AllowAnonymous]

    public class LoginModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly ILogger<LoginModel> _logger;

        public LoginModel(SignInManager<IdentityUser> signInManager, ILogger<LoginModel> logger)
        {
            _signInManager = signInManager;
            _logger = logger;
            Input = new InputModel();

        }

        [BindProperty]
        public InputModel Input { get; set; }

        public IList<AuthenticationScheme> ExternalLogins { get; set; }

        public string ReturnUrl { get; set; }


        [TempData]
        public string ErrorMessage { get; set; }
        [BindProperties]
        public class InputModel
        {

            public InputModel()
            {
                Dictionary<String, String> tipos = new Dictionary<string, string>();
                tipos = new Dictionary<string, string>();
                tipos.Add("CC", "Cédula de ciudadanía");
                //tipos.Add("NI", "NIT");
                tipos.Add("CE", "Cédula de extranjería");
                TiposIdentificacionOptions = new SelectList(tipos.ToList(), "Key", "Value");



            }
            /*   [Required]
               [EmailAddress]
               public string Email { get; set; }
               */
            public String acr_values { get; set; }
            public String loginHint { get; set; }
            public String ReturnUrl { get; set; }
            public String idToken { get; set; }
            [BindProperty]
            public String TipoIdentificacion { get; set; }
            [BindProperty]
            public String Identificacion { get; set; }

            [BindProperty]
            public String Idp { get; set; } = "";

            [BindProperty]
            public String TipoIdentificacionDependiente { get; set; }
            [BindProperty]
            public String IdentificacionDependiente { get; set; }

            [BindProperty]
            public String Nit { get; set; }
            public List<String> SelectedLoas { get; set; }

            public SelectList TiposIdentificacionOptions { get; set; }

            [BindProperty]
            public List<LOAClass> LoaOptions { get; set; }
            [BindProperties]
            public class LOAClass
            {
                [BindProperty]
                public String Key { get; set; }
                [BindProperty]
                public String Value { get; set; }

                [BindProperty]
                public int Index { get; set; }
                [BindProperty]
                public Boolean Selected { get; set; }
            }
        }


        public async Task OnGetAsync(string returnUrl = null)
        {
            if ( !string.IsNullOrEmpty(ErrorMessage))
            {
                ModelState.AddModelError(string.Empty, ErrorMessage);
            }

            returnUrl = returnUrl ?? Url.Content("~/");

            // Clear the existing external cookie to ensure a clean login process
            await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);

            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

            ReturnUrl = returnUrl;
        }

        public async Task<IActionResult> OnPostChallenge(string prov, string retUrl = null)
        {
            if (!string.IsNullOrEmpty(ErrorMessage))
            {
                ModelState.AddModelError(string.Empty, ErrorMessage);
            }

            //tomar de la configuración.
            var selectedLoa = (from p in Input.LoaOptions
                               where p.Selected == true
                               select p.Key).ToList();


            var hint = Input.TipoIdentificacion + Input.Identificacion + "," + Input.Nit;
         
            retUrl = retUrl ?? Url.Content("~/");
            var props = new AuthenticationProperties
            {
                RedirectUri = Url.Action("Callback", "ExternalLogin"),
                Items =
                    {
                        { "returnUrl", retUrl },
                        { "scheme", prov },
                        { "acr_values", String.Join("", selectedLoa) + " " + Input.Idp },
                        { "login_hint", hint },

                    }
            };

            return new RedirectToPageResult("./ExternalLogin", "Challenge", new {    provider =prov,
                                                                                        acr_values = String.Join(" ", selectedLoa) + " " + Input.Idp,
                                                                                        hint ,
                                                                                        returnUrl = retUrl });

        }
        public IActionResult OnGetLogoutExternal()
        {
            _signInManager.SignOutAsync();
            return SignOut("oidc");
        }
        public async Task<IActionResult> OnPostChallengeRegister(string prov,  string retUrl = null)
        {
            if (!string.IsNullOrEmpty(ErrorMessage))
            {
                ModelState.AddModelError(string.Empty, ErrorMessage);
            }

            //tomar de la configuración.
            var selectedLoa = (from p in Input.LoaOptions
                               where p.Selected = true
                               select p.Key).ToList();


            var hint = Input.TipoIdentificacion + Input.Identificacion + "," + Input.Nit;

            retUrl = retUrl ?? Url.Content("~/");/*
            var props = new AuthenticationProperties
            {
                RedirectUri = Url.Action("Callback", "ExternalLogin"),
                Items =
                    {
                        { "returnUrl", retUrl },
                        { "scheme", prov },
                        { "acr_values", "action:register" },
                        { "login_hint", hint },

                    }
            };*/

            // return Challenge(props, prov);


            return new RedirectToPageResult("./ExternalLogin", "Challenge", new
            {
                provider = prov,
                acr_values = String.Join("acr_values", "action:register"),
                login_hint= hint,
                returnUrl = retUrl
            });

        }
        public IActionResult OnPostPersonalizacion(string prov, string retUrl = null)
        {
            if (!string.IsNullOrEmpty(ErrorMessage))
            {
                ModelState.AddModelError(string.Empty, ErrorMessage);
            }
            if (User.Identity.IsAuthenticated)
            {
                var claims = User.Claims;
                var subClaim= claims.Where(p => p.Type == "name").FirstOrDefault();
                if (subClaim != null)
                {
                    String hint = subClaim.Value;
                    retUrl = retUrl ?? Url.Content("~/");

                    return new RedirectToPageResult("./ExternalLogin", "Challenge", new
                    {
                        provider = prov,
                        acr_values = "action:manage",
                        login_hint = hint,
                        returnUrl = retUrl
                    });
                }
                
                //tomar de la configuración.
              
            }
            return Page();

         

        }

    }
}
