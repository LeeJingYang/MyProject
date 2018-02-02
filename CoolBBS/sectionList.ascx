<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sectionList.ascx.cs" Inherits="CoolBBS.sectionList" %>
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
<div style="border: solid darkgrey 1px; border-radius: 5px;margin-top:5px;">
    <div style="border-bottom: solid 2px #E1E2E6;">
        <div style="margin-left:15px;">
            <asp:Label ID="lblSectionTypeName" ForeColor="#53BF57" Height="35px" runat="server" Font-Size="X-Large" Text='gg'></asp:Label>
        </div>
    </div>
    <div style="margin-top: 10px;">
        <asp:DataList ID="dgSectionList" runat="server" Width="100%" RepeatColumns="3">
            <ItemTemplate>
                <div style="text-align: center;margin-top:10px;">
                    <a href='DynamicList.aspx?SectionID=<%# Eval("SectionID") %>'>
                        <div>
                            <img style="width: 150px; height: 150px;border-radius:7px;" src='Image/SectionIcon/<%# Eval("SectionName") %>.jpg' />
                        </div>
                        <asp:Label ID="lblSectionName" runat="server" Text='<%# Eval("SectionName") %>'></asp:Label>
                    </a>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
