using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Rainsonglobal._240578
{
    public partial class UploadProductCatalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</Script>"));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String ImageUrl = "";
            if (imageedit.HasFile)
            {
                //ImageUrl = "~/upload/" + imageedit.FileName;
                //imageedit.SaveAs(Server.MapPath(ImageUrl));
                //MsgBox("Product Catalog Uploaded successfully.");


                //  string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(imageedit.FileName);
                string fileNameWithoutExtension = "Product Catalog";
                //==== Get file extension.
                string fileExtension = Path.GetExtension(imageedit.FileName);

                //=== Now we have both file name and its extension seperately we can now eaisly rename file name.

                //===== Adding some text in begining and end of the file name
               // fileNameWithoutExtension = "AddedText-" + fileNameWithoutExtension + "-AddedText";

                //===== Now lets upload the renamed file.

                imageedit.PostedFile.SaveAs(Server.MapPath("~/upload/" + fileNameWithoutExtension + fileExtension));
                MsgBox("Product Catalog Uploaded successfully.");

            }
           
           else
             MsgBox("Sorry! Something went Wrong.");
            
        }
    }
}