<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ul_list_default.ascx.cs" Inherits="NewStudent_ul_list_default" %>
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate> <ul></HeaderTemplate>
        <ItemTemplate>
       <%#Container.ItemIndex==(sum/2)?"</ul><ul>":" " %> 
            <li><a href='Detail.aspx?id=<%#Eval("id")%>' title="<%#Eval("title").ToString()%>">> <%#Common.CutString(Eval("title").ToString(),28)%></a></li>
        </ItemTemplate>
    <FooterTemplate></ul></FooterTemplate>
</asp:Repeater>
