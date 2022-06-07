using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace movies
{
    public partial class _Default : Page
    {

        string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetMovieDetails();
            }
        }

        void GetMovieDetails()
        {
            SqlConnection con = new SqlConnection(constr);

            SqlCommand cmd = new SqlCommand("sp_manage_movies_data", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@method", SqlDbType.VarChar).Value = "getallmovies";
            cmd.Parameters.AddWithValue("@movie_id", SqlDbType.Int).Value = 1;
            con.Open();
            rpt_movie.DataSource = cmd.ExecuteReader();
            rpt_movie.DataBind();
        }

        protected void rpt_movie_ItemDataBound(object source, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var hf_movie_id = (HiddenField)e.Item.FindControl("hf_movie_id");
                Repeater innerRepeaterWriters = (Repeater)e.Item.FindControl("rpt_movie_writers");
                Repeater innerRepeaterGenres = (Repeater)e.Item.FindControl("rpt_movie_genres");
                Repeater innerRepeaterStars = (Repeater)e.Item.FindControl("rpt_movie_stars"); // 1

                Repeater rpt_genres = (Repeater)e.Item.FindControl("rpt_genres");

                SqlConnection con = new SqlConnection(constr);

                SqlCommand cmd = new SqlCommand("sp_manage_movies_data", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@method", SqlDbType.VarChar).Value = "getallmovies_writers";
                cmd.Parameters.AddWithValue("@movie_id", SqlDbType.Int).Value =Convert.ToInt32( hf_movie_id.Value);

                con.Open();
                innerRepeaterWriters.DataSource = cmd.ExecuteReader();
                innerRepeaterWriters.DataBind();
                con.Close();
                
                cmd = new SqlCommand("sp_manage_movies_data", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@method", SqlDbType.VarChar).Value = "getallmovies_genres";
                cmd.Parameters.Add("@movie_id", SqlDbType.Int).Value = Convert.ToInt32(hf_movie_id.Value);

                con.Open();
                innerRepeaterGenres.DataSource = cmd.ExecuteReader();
                innerRepeaterGenres.DataBind();
                con.Close();

                cmd = new SqlCommand("sp_manage_movies_data", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@method", SqlDbType.VarChar).Value = "getallgenres";
                cmd.Parameters.Add("@movie_id", SqlDbType.Int).Value = Convert.ToInt32(hf_movie_id.Value);

                con.Open();
                rpt_genres.DataSource = cmd.ExecuteReader();
                rpt_genres.DataBind();
                con.Close();


                // 2.
                cmd = new SqlCommand("sp_manage_movies_data", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@method", SqlDbType.VarChar).Value = "getallmovies_stars";
                cmd.Parameters.Add("@movie_id", SqlDbType.Int).Value = Convert.ToInt32(hf_movie_id.Value);

                con.Open();
                innerRepeaterStars.DataSource = cmd.ExecuteReader();
                innerRepeaterStars.DataBind();
                con.Close();


            }
        }

        protected void rpt_movie_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            /*switch (e.CommandName)
            {
                case ("Delete"):
                    int EmpID = Convert.ToInt32(e.CommandArgument);
                    //deleteEmployee(EmpID);
                    break;
                case ("Update"):
                    EmpID = Convert.ToInt32(e.CommandArgument);
                    //EditEmployeeDetail(EmpID);
                    break;
            }*/

            if (e.CommandName == "update")
            {
                 
            }

            if (e.CommandName == "edit")
            {   
                ((Label)e.Item.FindControl("lb_movie_title")).Visible = false;
                ((TextBox)e.Item.FindControl("tb_movie_title")).Visible = true;

                ((Label)e.Item.FindControl("lb_movie_description")).Visible = false;
                ((TextBox)e.Item.FindControl("tb_movie_description")).Visible = true;

                ((Label)e.Item.FindControl("lb_movie_duration_time")).Visible = false;
                ((TextBox)e.Item.FindControl("tb_movie_duration_time")).Visible = true;


                Repeater rpt_movie_genres =(Repeater)e.Item.FindControl("rpt_movie_genres");
                
                Repeater rpt_genres =(Repeater)e.Item.FindControl("rpt_genres");
                rpt_genres.Visible = true;


                for (int i = 0; i <= rpt_genres.Items.Count - 1; i++)
                {
                    string genres = ((CheckBox)rpt_genres.Items[i].FindControl("cb_genres_title")).Text;
                    for (int j = 0; j <= rpt_movie_genres.Items.Count - 1; j++)
                    {
                        string movie_genres = ((Label)rpt_movie_genres.Items[j].FindControl("lb_genres_title")).Text;
                        if (movie_genres == genres)
                        { ((CheckBox)rpt_genres.Items[i].FindControl("cb_genres_title")).Checked = true; }
                    }
                }

                rpt_movie_genres.Visible = false;

                ((LinkButton)e.Item.FindControl("lnk_Edit")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnk_Update")).Visible = true;
                ((LinkButton)e.Item.FindControl("lnk_Cancel")).Visible = true;
            }

            if (e.CommandName == "cancel")
            {
                Repeater rpt_movie_genres = (Repeater)e.Item.FindControl("rpt_movie_genres");
                Repeater rpt_genres = (Repeater)e.Item.FindControl("rpt_genres");

                rpt_movie_genres.Visible = true;
                rpt_genres.Visible = false;

                ((Label)e.Item.FindControl("lb_movie_title")).Visible = true;
                ((TextBox)e.Item.FindControl("tb_movie_title")).Visible = false;

                ((Label)e.Item.FindControl("lb_movie_description")).Visible = true;
                ((TextBox)e.Item.FindControl("tb_movie_description")).Visible = false;

                ((Label)e.Item.FindControl("lb_movie_duration_time")).Visible = true;
                ((TextBox)e.Item.FindControl("tb_movie_duration_time")).Visible = false;




                ((LinkButton)e.Item.FindControl("lnk_Edit")).Visible = true;
                ((LinkButton)e.Item.FindControl("lnk_Update")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnk_Cancel")).Visible = false;
            }


        }
    }
}