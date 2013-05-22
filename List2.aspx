<%@ Page Language="C#" MasterPageFile="~/NewStudent/MasterPage.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="NewStudent_List" Title="新生专题" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSPlaceHolder" Runat="Server">
<meta name="keywords" content="广东工业大学,广工,新生专题,录取分数线,入学"/>
<meta name="description" content="广东工业大学新生专题网" />
<link href="css/list.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<script type="text/javascript">
columns=<%=catid %>;
</script>
  <div id="main">    
        <div id="left">
			<div id="nav">
    			<ul>
                  <li><a id="nav1" href="List.aspx?campus=<%=campus %>&99" applyclass="h1"></a></li>
                  <li><a id="nav2" href="List.aspx?catid=<%=columns[0] %>" applyclass="h2"></a></li>
                  <li><a id="nav3" href="List.aspx?catid=<%=columns[1] %>" applyclass="h3"></a></li>
                  <li><a id="nav4" href="List.aspx?catid=<%=columns[2] %>" applyclass="h4"></a></li>
                  <li><a id="nav5" href="List.aspx?catid=<%=columns[3] %>" applyclass="h5"></a></li>
                </ul>
    		</div>

		</div>
        <div id="right">
            <img src="images/list-left-topimg.gif" />
            <div>  
               <ul>
               
               <asp:Repeater ID="rp" runat="server" >           
               <ItemTemplate>
                <%#(Container.ItemIndex-1)%5==4?" </ul></div><div><ul>":" " %>
                      <li><img src="images/list-right-point.gif" /><a href="Detail.aspx?id=<%#Eval("id") %>"><%#Eval("title") %></a></li>
               </ItemTemplate>
               </asp:Repeater>
               </ul>        
            </div>  
            <div id="right-down"> 
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" PageSize="20" OnPageChanged="Page_Load" FirstPageText="首页" LastPageText="末页">
                </webdiyer:AspNetPager>
            </div>
     </div>
     </div>
<script type="text/javascript">
if(columns){$("#nav a[href*="+columns+"]").addClass($("#nav a[href*="+columns+"]").attr("applyclass"))}
</script>
</asp:Content>

