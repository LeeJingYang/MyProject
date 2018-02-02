<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserDynamicList.aspx.cs" Inherits="CoolBBS.UserDynamicList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a:hover{
            cursor:pointer;
            color:#ff6a00;
        }
        a{
            text-decoration:none;
        }
        .lblSectionName {
            color: blue;
            font-size: 16px;
        }

        .lblDynamicTitle {
            color: darkgoldenrod;
            font-size: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 20px; height: auto;">
        <div style="border: solid darkgray 1px; border-radius: 8px; background: white;">
            <div style="border-bottom: solid darkgray 1px; text-align: left">
                <label style="font-family: SimHei; font-size: larger; margin-left: 10px;">帖子</label>
            </div>
            <div style="width: 100%; display: flex; flex-direction: row; text-align: center;border-bottom:solid darkgrey 1px;">
                <label style="width: 50%; height: 100%; border-right: solid darkgrey 1px; font-size: 16px;">主题</label>
                <label style="width: 15%; height: 100%; border-right: solid darkgrey 1px; font-size: 16px;">话题</label>
                <label style="width: 15%; height: 100%; border-right: solid darkgrey 1px; font-size: 16px;">回复/查看</label>
                <label style="width: 20%; height: 100%; font-size: 16px;">发帖时间</label>
            </div>
            <div>
                <asp:DataList ID="dgDynamicList" Width="100%" runat="server">
                    <ItemTemplate>
                        <div style="display: flex; flex-direction: row; text-align: center;height:33px;padding-bottom:2px;">
                            <asp:HyperLink Width="50%" NavigateUrl='<%# Eval("DynamicID") %>' CssClass="lblDynamicTitle" ID="hyDynamic" runat="server"><%# Eval("DynamicTitle") %></asp:HyperLink>
                            <asp:HyperLink Width="15%" NavigateUrl='<%# Eval("SectionID") %>' CssClass="lblSectionName" ID="hySection" runat="server"><%# Eval("SectionName") %></asp:HyperLink>
                            <asp:HyperLink Width="15%" ID="hyReplyReadCount" runat="server"><%# Eval("ReplyCount") %>/<%# Eval("ReadCount") %></asp:HyperLink>
                            <asp:Label Width="20%" ID="lblPublishDate" runat="server"><%# Eval("PublishDate") %></asp:Label>
                        </div>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <div style="height:3px;border-bottom:dashed darkgrey 1px;"></div>
                    </SeparatorTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>
