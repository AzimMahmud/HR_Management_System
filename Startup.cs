using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HR_Management_System.Startup))]
namespace HR_Management_System
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
