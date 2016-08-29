using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BotNinja.Startup))]
namespace BotNinja
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
