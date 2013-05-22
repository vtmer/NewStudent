<%@ Page Language="C#" MasterPageFile="~/NewStudent/MasterPage.master" AutoEventWireup="true" CodeFile="Photo.aspx.cs" Inherits="NewStudent_Detail" Title="Untitled Page" EnableViewState="false" %>
<%@ Register Src="~/NewStudent/ul_list_detail.ascx" TagPrefix="uc" TagName="hotlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSPlaceHolder" Runat="Server">
<link rel="stylesheet"  href="CSS/detail.css" type="text/css"  />
<link rel="stylesheet"  href="colorbox/colorbox.css" type="text/css"  />
<meta name="keywords" content="<%=keywords %>,广东工业大学,广工"/>
<meta name="description" content="<%=introduction %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
     
        
 <div id="left">
  <!--这个是左边的新闻部分 begin--->
  <div id="left-top">
     <div class="title" style="width:950px"><a href="../">工大在线</a><span>></span><a href="Default.aspx" id="defaultlink">新生专题</a><span>></span><a href="Maps.aspx?campus=<%=campus %>">E眼工大</a></div>
     <div class="kong" style="width:950px"></div>
     <div class="content" style="width:950px">
       <div class="header" style="width:850px">【<%=title %>】</div>
       <div class="center" style="width:850px"><span style="width:200px">来源：<%=scource %></span><span class="a"><a href="#">大</a> <a href="#">中</a> <a href="#">小</a></span><span class="a">发表时间：<%=datetime %></span></div>
       <div class="text" style="width:850px">　<%=content %></div>
       <div class="name" style="width:850px">（作者：<%=author %>）</div>
      <div id="pager" style="width:950px"></div> 
       <div class="below"></div>
      </div>
   </div>
   <script type="text/javascript">
	var part = $("#left-top .text").html().split(/<hr[^<]*>/i);	
    var pagecount=part.length;
    var currentpage = location.hash.indexOf("#")==-1?1:(isNaN(location.hash.substring(1))?1:(location.hash.substring(1)));//获取锚记
   function getcode(){for(i=1;i<=pagecount;i++){if(currentpage==i){pagerstr+="<a class='pagerlist'   style='background-color:#f39800;color:#fff' href='#"+i+"'>"+i+"<a/>";}else{pagerstr+="<a class='pagerlist' href='#"+i+"'>"+i+"<a/>";}};$("#pager").html(pagerstr); $("#pager a").click(function(){currentpage=$(this).text();changeindex($(this).text())});roll()}
   function changeindex(index){pagerstr='';$("#left-top .text").html(part[index-1]);/*window.scrollTo(100,100)*/;getcode();} 
   function roll(){;y=self.pageYOffset||(document.documentElement&&document.documentElement.scrollTop)||document.body.scrollTop;setTimeout(function(){y>270?(window.scrollTo(80,y-(y-270)/4),roll()):(clearTimeout())},10)}  
    if(pagecount>1)changeindex(currentpage); 
	</script>
  <!--这个是左边的新闻部分 end--->
  <!--这个是相关文章和相关评论 begin-->

  <div class="left-middle" >
    <div class="title" ><p>&nbsp;&nbsp;相关评论</p></div>
     <div class="middle" >
       <ul id="comment_ul" >
<%--      <asp:Repeater runat="server" ID="commentpl"><ItemTemplate>
       <li class="height"><div class="person"><a ><%#Eval("username") %></a>&nbsp;说</div><%#Eval("comcontent") %></li>

       </ItemTemplate>
       
       </asp:Repeater> --%>
  <li class="height"><div class="person"><a >#username# </a>&nbsp;说：</div>#comcontent#</li>
       </ul>
    </div>
  </div>
  <div class="none"></div>
  <!--这个是相关文章和相关评论 end-->
  <!--下面是提交评论的框-->
  <div id="left-below">
    <p><span>昵称：</span>&nbsp;&nbsp;<input name="nickname" id="nickname" type="text"  class="one" value="广工新生"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>验证码：</span>&nbsp;&nbsp;<input name="keyword" type="text"  class="two" id="checkcode"/><span id="codeimg"></span></p>
    <p><span class="pl">评论：</span>&nbsp;&nbsp;<textarea name="pl" rows="5" class="three" id="pl"></textarea></p>
      <p>
          <input id="insertcomment" type="button" value="发表评论" />&nbsp;</p>
  </div>
 </div>
 
 <!--右边部分-->
<script type="text/javascript" src="script/Repeater.js"></script>

<script type="text/javascript">


columns=<%=catid %>
$("#defaultlink").attr("href","Default.aspx?campus="+campus);

var commentdata,rp;

function loadcomment(){
$.get("Comment.ashx?"+Math.random(),
        {id:'<%=id %>'},
        function(data){commentdata = new dataBox(data); if(!rp){rp = new Repeater($("#comment_ul"),commentdata);}else {rp.jsonData=commentdata;rp.draw();} });
}
loadcomment();
$("#checkcode").focus(function(){$("#codeimg").html("<img src='checkCode.aspx?"+Math.random()+"'/>")})
$("#checkcode").blur(function(){$("#codeimg").html("")})
$("#insertcomment").click(function(){
$.get("Comment.ashx",
        {id:'<%=id %>',action:"insert",name:$("#nickname").val(),checkcode:$("#checkcode").val(),comment:$("#pl").val()},
        function(data){alert(data);loadcomment()}
)})


</script>
</asp:Content>

