
/**
 * The Product class
 * 
 * This is just to simulate some way of accessing data about  our products
 */
using System.Data.SqlClient;
using System.Configuration;
public class Product
{

	public int Id { get; set; }
	public decimal Price { get; set; }
    public decimal PV { get; set; }
	public string Description { get; set; }

	public Product(int id)
	{
		this.Id = id;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from ProductRepurchase where ProductID = " + id.ToString(), con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            this.Price = decimal.Parse(dr["PriceInINR"].ToString());
            this.Description = dr["ProductName"].ToString() + "(" + dr["ProductCode"].ToString() + ")";
            this.PV = decimal.Parse(dr["PV"].ToString());
            break;
        }
		dr.Close();
        con.Close();
	}
}


