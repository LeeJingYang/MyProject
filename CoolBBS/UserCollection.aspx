<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserCollection.aspx.cs" Inherits="CoolBBS.UserCollection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a {
            text-decoration: none;
        }

        .ahover:hover {
            cursor: pointer;
            color: #ff6a00;
        }

        .borderradiu {
            border-radius: 7px;
        }

        .agrey {
            color: darkgray;
        }

        .lblSectionName {
            color: blue;
            font-size: 16px;
        }

        .lblDynamicTitle {
            color: darkgoldenrod;
            font-size: 16px;
        }
        .cursorPoint:hover{
            cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:10px;">
        <asp:DataList ID="dgDynamicList" CssClass="borderradiu" Width="100%" BackColor="White" runat="server">
            <ItemTemplate>
                <div class="templateMain" style="margin-left: 10px; margin-top: 5px; width: 100%">
                    <div style="float: left">
                        <a href='OtherUserInfo.html'>
                            <asp:Image ID="imgUserHeadPic" Height="60px" Width="60px" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" /></a>
                    </div>
                    <div style="float: left; margin-left: 10px;">
                        <div style="margin-top: 10px; overflow: hidden; display: flex; flex-direction: row;">
                            <a class="ahover lblSectionName" href='DynamicList.aspx?SectionID=<%# Eval("SectionID") %>'>[<asp:Label ID="lblSectionName" runat="server" Text='<%# Eval("SectionName") %>'></asp:Label>]</a>
                            <a class="ahover lblDynamicTitle" href='DynamicInfo.aspx?DynamicID=<%# Eval("DynamicID") %>'>
                                <asp:Label ID="lblDynamicTitle" ForeColor="#808080" runat="server" Text='<%# Eval("DynamicTitle") %>'></asp:Label>
                            </a>
                        </div>
                        <div style="margin-top: 12px; color: darkgrey; font-size: 15px;">
                            <a href='OtherUserInfo.html?UserNum=<%# Eval("UserNum") %>' class="agrey ahover">
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></a>
                            <%--<asp:Button ID="Button1" runat="server" BackColor="Transparent" CommandName="toOtherUserInfo" CommandArgument='<%# Eval("UserNum") %>' BorderStyle="None" Text='<%# Eval("UserName") %>' />|--%>
                            <asp:Label ID="Label4" runat="server" Text="浏览:"></asp:Label>
                            <asp:Label ID="lblDynamicReadCount" runat="server" Text='<%# Eval("ReadCount") %>'></asp:Label>|
                                <asp:Label ID="Label7" runat="server" Text="回复:"></asp:Label>
                            <a href='DynamicInfo.aspx?DynamicID=<%# Eval("DynamicID") %>' class="agrey ahover">
                                <asp:Label ID="lblReplyCount" runat="server" Text='<%# Eval("ReplyCount") %>'></asp:Label></a>    |
                                <asp:Label ID="Label6" runat="server" Text="发布于:"></asp:Label>
                            <asp:Label ID="lblPublishDate" runat="server" Text='<%# Eval("PublishDate") %>'></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <div style="width: 90%; height: 10px; margin: auto; border-bottom: dotted darkgrey 1px;"></div>
            </SeparatorTemplate>
        </asp:DataList>
    </div>
</asp:Content>
