<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ul_list_detail.ascx.cs" Inherits="NewStudent_ul_list_detail" %>

 <div class="right-top">
   <div class="title"><%=catname %></div>
   <div class="middle">
     <ul><asp:Repeater runat="server" ID="rp"><ItemTemplate>
     <li><span <%#Container.ItemIndex>2?"class='color'":""%>><%#Container.ItemIndex+1 %></span><a href="Detail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>">&nbsp;<%#Common.CutString(Eval("title").ToString(),35) %></a></li>
     </ItemTemplate></asp:Repeater>
     </ul>
   </div>
   <div class="below"></div>
 </div>