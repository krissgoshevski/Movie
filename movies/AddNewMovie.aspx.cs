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
    public partial class AddNewMovie : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Get_All_Genres();

                Get_All_Users("getallusers", ddl_director);
                Get_All_Users("getallusers", ddl_writers);
                Get_All_Users("getallusers", ddl_stars);                
            }
        }
        void Get_All_Users(string method, DropDownList ddl)
        {
            SqlConnection con = new SqlConnection(constr);

            using (SqlCommand cmd = new SqlCommand("sp_manage_movies_data", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@method", SqlDbType.VarChar).Value = method;
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        ddl.DataSource = dr;
                        ddl.DataTextField = "full_name";
                        ddl.DataValueField = "user_id";
                        ddl.DataBind();
                        ddl.Items.Insert(0, new ListItem("-Select-", "0"));
                    }
                }
                con.Close();
            }
        }

        void Get_All_Genres()
        {
            SqlConnection con = new SqlConnection(constr);

            using (SqlCommand cmd = new SqlCommand("sp_manage_movies_data", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@method", SqlDbType.VarChar).Value = "getallgenres";
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        cb_genres.DataSource = dr;
                        cb_genres.DataTextField = "genres_title";
                        cb_genres.DataValueField = "genres_id";
                        cb_genres.DataBind();
                        //cb_genres.Items.Insert(0, new ListItem("-Select-", "0"));
                    }
                }
                con.Close();
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_InsertMovieData", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    cmd.Parameters.AddWithValue("@movie_title", SqlDbType.VarChar).Value = tb_movie_title.Text.Trim();
                    cmd.Parameters.AddWithValue("@movie_description", SqlDbType.VarChar).Value = tb_movie_description.Text.Trim();
                    cmd.Parameters.AddWithValue("@movie_released_date", SqlDbType.VarChar).Value = tb_movie_released_date.Text.Trim();
                    cmd.Parameters.AddWithValue("@movie_duration_time", SqlDbType.Time).Value = tb_movie_duration_time.Text.Trim();


                    if (tb_director_first_name.Text == string.Empty &&
                        tb_director_last_name.Text == string.Empty)
                    {
                        cmd.Parameters.Add("@movie_director", SqlDbType.Int).Value = Convert.ToInt32(ddl_director.SelectedValue.ToString());
                    }
                    else
                    {
                        cmd.Parameters.Add("@movie_director_first_name", SqlDbType.VarChar).Value = tb_director_first_name.Text;
                        cmd.Parameters.Add("@movie_director_last_name", SqlDbType.VarChar).Value = tb_director_last_name.Text;
                    }



                    string genres ="";
                    for (int i = 0; i < cb_genres.Items.Count; i++)
                    {
                        if (cb_genres.Items[i].Selected)
                        {
                            genres = genres + cb_genres.Items[i].Value + ",";
                        }
                    }
                    cmd.Parameters.AddWithValue("@genres", SqlDbType.VarChar).Value = genres;







                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            //GetEmployeeDetail();
            Response.Redirect("/default.aspx");
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //int cnt = FindOccurence("ddlDynamic");
            //CreateDropDownList("ddlDynamic-" + Convert.ToString(cnt + 1));
        }
        /*
        private int FindOccurence(string substr)
        {
            string reqstr = Request.Form.ToString();
            return ((reqstr.Length - reqstr.Replace(substr, "").Length)
                              / substr.Length);
        }

        private void CreateDropDownList(string ID)
        {
            DropDownList ddl = new DropDownList();
            ddl.ID = ID;

            ddl.Items.Add(new ListItem("--Select--", ""));
            ddl.Items.Add(new ListItem("One", "1"));
            ddl.Items.Add(new ListItem("Two", "2"));
            ddl.Items.Add(new ListItem("Three", "3"));
            ddl.AutoPostBack = true;
            //ddl.SelectedIndexChanged += new EventHandler(OnSelectedIndexChanged);
            pnlDropDownList.Controls.Add(ddl);

            Literal lt = new Literal();

            lt.Text = "<br />";

            pnlDropDownList.Controls.Add(lt);

        }

        private void RecreateControls(string ctrlPrefix, string ctrlType)
        {
            string[] ctrls = Request.Form.ToString().Split('&');
            int cnt = FindOccurence(ctrlPrefix);
            if (cnt > 0)
            {
                for (int k = 1; k <= cnt; k++)
                {
                    for (int i = 0; i < ctrls.Length; i++)
                    {
                        if (ctrls[i].Contains(ctrlPrefix + "-" + k.ToString())
                            && !ctrls[i].Contains("EVENTTARGET"))
                        {
                            string ctrlID = ctrls[i].Split('=')[0];
                            if (ctrlType == "DropDownList")
                            {
                                CreateDropDownList(ctrlID);
                            }
                            break;
                        }
                    }
                }
            }
        }*/
    }
}