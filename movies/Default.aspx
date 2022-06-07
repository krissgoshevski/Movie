<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="movies._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4>Movies </h4>
    </div>


    <asp:Button runat="server" ID="btn_add_new_movie" Text="Add New Movie" PostBackUrl="AddNewMovie.aspx" />

    <div class="row">
        <asp:Repeater ID="rpt_movie" runat="server" OnItemCommand="rpt_movie_ItemCommand" OnItemDataBound="rpt_movie_ItemDataBound">
            <ItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <b>No. :</b><%#Eval("movie_id") %>&nbsp;                           
                            <asp:HiddenField ID="hf_movie_id" runat="server" Value='<%#Eval("movie_id") %>' />
                        </td>
                        <td style="width: 200px">
                            <b>Title :</b>                            
                            <asp:Label ID="lb_movie_title" runat="server" Text='<%# Eval("movie_title") %>'></asp:Label>
                            <asp:TextBox ID="tb_movie_title" runat="server" Text='<%# Eval("movie_title") %>' Visible="false"></asp:TextBox>
                        </td>
                        <td style="width: 500px">
                            <b>Description: </b>
                            <asp:Label ID="lb_movie_description" runat="server" Text='<%# Eval("movie_description") %>'></asp:Label>
                            <asp:TextBox ID="tb_movie_description" runat="server" TextMode="MultiLine" Width="500" Rows="4" Text='<%# Eval("movie_description") %>' Visible="false"></asp:TextBox>

                        </td>
                        <td style="width: 250px">
                            <b>Duration time: 
                            <asp:Label ID="lb_movie_duration_time" runat="server" Text='<%# Eval("movie_duration_time") %>'></asp:Label>
                            <asp:TextBox ID="tb_movie_duration_time" runat="server" Text='<%# Eval("movie_duration_time") %>' Visible="false"></asp:TextBox>
                        </td>
                        <td style="width: 150px">
                            <b>Director:</b>
                            <%#Eval("movie_director_full_name") %>    
                        </td>
                        <table>
                            <tr>
                                <b>Movie genres:</b>
                                <asp:Repeater ID="rpt_movie_genres" runat="server">
                                    <ItemTemplate>
                                        <td style="width: 250px">
                                            <asp:Label ID="lb_genres_title" runat="server" Text='<%# Eval("genres_title") %>'></asp:Label>                                          
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Repeater ID="rpt_genres" runat="server" Visible="false">
                                    <ItemTemplate>
                                        <td style="width: 250px">
                                            <asp:CheckBox ID="cb_genres_title" runat="server" Text='<%# Eval("genres_title") %>'></asp:CheckBox>                                          
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <b>Movie writers :</b><asp:Repeater ID="rpt_movie_writers" runat="server">
                                    <ItemTemplate>
                                        <td style="width: 250px">
                                            <%#Eval("first_name") %>&nbsp;
                                            <%#Eval("last_name") %>    
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
                        

                        <table>
                            <tr>
                                <b>Movie stars:</b><asp:Repeater ID="rpt_movie_stars" runat="server">
                                    <ItemTemplate>
                                        <td style="width: 250px">
                                           <%#Eval("first_name") %>&nbsp;
                                            <%#Eval("last_name") %>                                             
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
                        
                        <td>
                            <asp:LinkButton ID="lnk_Edit" runat="server" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "movie_id")%>'>Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnk_Update" runat="server" CommandName="update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "movie_id")%>' Visible="false">Update</asp:LinkButton>
                            <asp:LinkButton ID="lnk_Cancel" runat="server" CommandName="cancel" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "movie_id")%>' Visible="false">Cancel</asp:LinkButton>                           
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
