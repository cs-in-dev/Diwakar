using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Diwakar.Old_App_Code
{
    public static class LogControl
    {
        public static async Task WriteALine(string line)
        {
            string FilePath=Path.Combine(System.Web.HttpContext.Current.Server.MapPath("/")+"upload/DiwakarLogFile.txt");

            using (StreamWriter sw = new StreamWriter(FilePath, append: true))
            {
                try
                {
                    await sw.WriteLineAsync(line != null && line != "" ? (DateTime.UtcNow.ToString("dd-MM-yyyy HH:mm:ss tt", CultureInfo.InvariantCulture) + " UTC  : " + line) : "");
                }
                catch (Exception ex)
                {

                    throw;
                }

            }
        }
    }
}