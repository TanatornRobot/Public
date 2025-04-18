using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Public.View
{
    public partial class PersonalData : System.Web.UI.Page
    {
        private static readonly HttpClient client = new HttpClient();

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadData();
            }

        }
        private async Task LoadData()
        {
            string apiUrl = "https://newprorjectapi-production.up.railway.app/api/product";

            try
            {
                var response = await client.GetStringAsync(apiUrl);
                var products = JsonConvert.DeserializeObject<List<Product>>(response);

                gvProduct.DataSource = products;
                gvProduct.DataBind();
            }
            catch (Exception ex)
            {
                // สามารถ log หรือแสดงข้อความได้
                Response.Write($"<script>alert('เกิดข้อผิดพลาด: {ex.Message}');</script>");
            }
        }
        protected void gvProduct_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            gvProduct.PageIndex = e.NewPageIndex;
            LoadData().Wait(); // เรียกแบบ sync เพื่อไม่ให้ error
        }
        protected void gvProduct_Sorting(object sender, GridViewSortEventArgs e)
        {
            var response = client.GetStringAsync("https://newprorjectapi-production.up.railway.app/api/product").Result;
            var products = JsonConvert.DeserializeObject<List<Product>>(response);

            if (e.SortExpression == "FirstName")
            {
                products = products.OrderBy(p => p.First_name).ToList();
            }

            gvProduct.DataSource = products;
            gvProduct.DataBind();
        }

    }
}