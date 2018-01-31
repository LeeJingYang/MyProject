<%@ Page Title="" Language="C#" MasterPageFile="~/Head.Master" AutoEventWireup="true" CodeBehind="SectionList.aspx.cs" Inherits="CoolBBS.SectionList" %>

<%@ Register Src="~/sectionList.ascx" TagPrefix="uc1" TagName="sectionList" %>


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
    <div>
        <div>
            <div>
                <asp:Panel ID="panelSectionList" Width="100%" runat="server"></asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
