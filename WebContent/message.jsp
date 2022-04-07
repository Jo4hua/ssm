<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.one{
		width:245px;
		height:245px;
		background:url("temp/images/know.png") no-repeat;
		background-size:100% 245px;
		margin:20px 80px;
		border-radius:3px;
		float:left;
	}
	.two{
		width:245px;
		height:245px;
		background:url("temp/images/join.jpg") no-repeat;
		background-size:100% 245px;
		margin:20px 80px;
		border-radius:3px;
		float:left;
	}
	.three{
		width:245px;
		height:245px;
		background:url("temp/images/personal.png") no-repeat;
		background-size:100% 245px;
		border-radius:3px;
		margin:20px 80px;
		float:left;
	}
</style>
</head>
<body>
<%@include  file="head.jsp"%>
<div style="height:500px">
<h2>公司介绍:</h2>
<p>本公司是中国地区的采购与供应链管理解决方案和服务提供商。公司2014年6月成立于苏州，目前，元速在苏州、上海、北京、长沙等地建立办事处。
元速信息专注于为客户提供基于云服务、大数据和移动互联网的社区化精益采购管理体系咨询服务。通过对供应商、寻源、价格、成本管理、物流执行等各方面进行全生命周期的精细化和流程化梳理，优化采购工具和方式，为采供各方的不同部门和组织间提供协同运作的平台、明晰可见的决策依据；以客户需求和市场定价为导向，通过云端共享和数据分析，帮助企业变被动采购为主动采购，协同产品工艺和质量的提升，实现由单纯控制成本到创造增值价值的跨越、从"小采购"到"大采购"的跨越，全面提高企业的成本控制和业绩提升能力。
　　元速的产品和方案在机械、电子电器、汽车汽配、太阳能等传统和新兴行业中获得广泛应用，其中涵盖了世界500强和国内众多大型制造企业。</p>
<h2>产品&服务:</h2>
<a href="message.jsp"><div class="one">
了解我们
</div></a>
<div class="two">
加入我们
</div>
<a href="personal.jsp">
<div class="three">
个人中心
</div>
</a>
</div>
<%@include  file="bottom.jsp"%>
</body>
</html>