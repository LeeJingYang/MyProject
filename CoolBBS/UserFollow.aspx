<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserFollow.aspx.cs" Inherits="CoolBBS.UserFollow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a {
        color: #808080;
        text-decoration: none;
    }

        a:hover {
            cursor: pointer;
            color: #ff6a00;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 10px;">
        <asp:DataList ID="dgUserFollow" runat="server" Width="100%" RepeatColumns="3">
            <ItemTemplate>
                <div style="text-align: center; margin-top: 10px;">
                    <a href='OtherUserInfo.html?UserNum=<%# Eval("UserNum") %>'>
                        <div>
                            <img style="width: 100px; height: 100px;" src='<%# Eval("PicturesPath") %>' />
                        </div>
                        <asp:Label ID="lblSectionName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                    </a>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
