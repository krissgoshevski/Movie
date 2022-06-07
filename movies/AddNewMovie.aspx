<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewMovie.aspx.cs" Inherits="movies.AddNewMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h4>Add New Movie</h4>
    </div>

    <p>
        Movie Title: &nbsp;
        <asp:TextBox ID="tb_movie_title" runat="server" Width="300"></asp:TextBox>
        <br /><br />

        Movie Description: &nbsp;
        <asp:TextBox ID="tb_movie_description" runat="server" Width="500" TextMode="MultiLine" Rows="4"></asp:TextBox>
        <br />

        Movie Released Date: &nbsp;
        <asp:TextBox ID="tb_movie_released_date" runat="server"></asp:TextBox>
        <br />

        Movie Duration time: &nbsp;
        <asp:TextBox ID="tb_movie_duration_time" runat="server"></asp:TextBox>
        <br />

        <table id="director" style="">
            <tr>
                <td style="padding:5px;">Director First Name
                </td>
                <td style="padding-left:5px;">Director Last Name
                </td>
                <td>or
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="tb_director_first_name" runat="server"></asp:TextBox></td>
                <td  style="padding-left:5px;">
                    <asp:TextBox ID="tb_director_last_name" runat="server"></asp:TextBox></td>
                <td></td>
                <td>
                    <asp:DropDownList ID="ddl_director" runat="server"></asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />

        Genres: &nbsp;    <br/>     
        <asp:CheckBoxList ID="cb_genres" runat="server"             
            RepeatColumns="1"
            RepeatDirection="Vertical"
            RepeatLayout="Flow"
            TextAlign="Right">
        </asp:CheckBoxList>

        <br />

        Movie Wiriters: &nbsp; 
        <asp:DropDownList ID="ddl_writers" runat="server"></asp:DropDownList>
        <br />

        Movie Stars: &nbsp; 
        <asp:DropDownList ID="ddl_stars" runat="server"></asp:DropDownList>
        <br />
    </p>

    <asp:Button runat="server" ID="btnSave" Text="SAVE / Add Movie" OnClick="btnSave_Click" />

</asp:Content>
