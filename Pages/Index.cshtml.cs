using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EntidadTestClient;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Authorization;
using IdentityServer4;

namespace Dummy.Pages
{
    [AllowAnonymous]
    [BindProperties]
    public class IndexModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;

        public IndexModel(SignInManager<IdentityUser> _signInManager)
        {
            this._signInManager = _signInManager;
            //this.Configuration = Configuration;
            Input = new InputModel();
            Dictionary<String, String> tipos = new Dictionary<string, string>();
            tipos = new Dictionary<string, string>();
            tipos.Add("CC", "Cédula de ciudadanía");
            tipos.Add("NI", "NIT");
            tipos.Add("CE", "Cédula de extranjería");
            Input.TiposIdentificacionOptions = new SelectList(tipos.ToList(), "Key", "Value");

            
        }
        //public IConfiguration Configuration { get; }
        public async void OnGet()
        {
            //   this.Input.acr_values = Configuration.GetSection("AuthConfiguration").Get<AuthConfiguration>().acr_values;
            this.Input.acr_values = "loa1";
            var result = await HttpContext.AuthenticateAsync();
            if (result?.Succeeded == true)
            {
                Input.idToken = result.Properties.GetTokenValue("id_token");
            }
            Input.Identificacion = "100";
            Input.TipoIdentificacion = "NI";

        }
        public IActionResult OnGetLogoutExternal()
        {
                        _signInManager.SignOutAsync();
            return SignOut("oidc");
        }

        public async void OnPostChallenge()
        {

        }

        [BindProperty]
        public InputModel Input { get; set; } = new InputModel();

        public class InputModel
        {
            public String acr_values { get; set; }
            public String loginHint { get; set; }
            public String ReturnUrl { get; set; }
            public String idToken { get; set; }
            public String TipoIdentificacion { get; set; }
            public String Identificacion { get; set; }
            public SelectList TiposIdentificacionOptions { get; set; }
        }
        public String Identificacion { get; set; }
        public String TipoIdentificacion { get; set; }


    }
}
