using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NerdWardrobeMVC.Startup))]
namespace NerdWardrobeMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
