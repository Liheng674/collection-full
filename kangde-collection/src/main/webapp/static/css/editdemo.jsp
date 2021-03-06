<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<link href="${ctxStatic}/js/kendoui/styles/kendo.common.min.css" rel="stylesheet">
<link href="${ctxStatic}/js/kendoui/styles/kendo.default.min.css" rel="stylesheet">
<script src="${ctxStatic}/js/kendoui/js/kendo.all.min.js"></script>
<script src="${ctxStatic}/js/easyui-${ev}/datagridview/datagrid-bufferview-min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑</title>
<link rel="stylesheet" type="text/css" href="edit_look.css"> 
<style>
   *{
	   font-size:14px;
   }
   input{
      height:28px;
   }
</style>
</head>

<body >
<!-- 主表信息 -->
    
	<div class="pop_col_outter">
		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					编号：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" required="true" type="text"  value=""
						validType="length[0,50]" size="17">
					<span class="taskWeituodanRed"><font size="2" color="red">*</font></span>
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					任务类型：
				</dt>
				<dt class="dt2">
					竣工验收
				</dt>
			</dl>
		</div>

		<div class="pop_col_one">
			<dl>
				<dt class="dt1">
					项目名称：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" required="true" type="text" value=""
						validType="length[0,50]">
					<font size="2" color="red">*</font>
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					环评审批部门：
				</dt>
				<dt class="dt2">
					<select id="wtdaddeiaDepartment" editable="false" value=""
						class="easyui-combobox" style="width: 140px;"><!--134px -->
						<option value="1">
							环境保护部
						</option>
						<option value="2">
							湖北省环保厅
						</option>
						<option value="3">
							其它
						</option>
					</select>
					<span class="taskWeituodanRed"> <font size="2" color="red">*</font></span>
				</dt>
			</dl>
		</div>
		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					建设地点：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" value="" validType="length[0,50]"size="17">
				</dt>
			</dl>
		</div>
		<div class="pop_col_one">
			<dl>
				<dt class="dt1">
					建设单位：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" required="true"
						value="" validType="length[0,50]">
				<font size="2" color="red">*</font>
				</dt>
			</dl>
		</div>

		<div class="pop_col_one">
			<dl>
				<dt class="dt1">
					委托单位：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" required="true" value=""
						validType="length[0,50]" size="68">
					<font size="2" color="red">*</font>
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					联系人：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" required="true" value="" validType="length[0,30]" size="17">
					<span class="taskWeituodanRed"><font size="2" color="red">*</font></span>
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					电话：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" required="true" validType="tel" value="" size="17">
					<span class="taskWeituodanRed"><font size="2" color="red">*</font></span>
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					QQ号：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" validType="QQ" value="" size="17">
				</dt>
			</dl>
		</div>
		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					备用电话：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" required="" validType="tel"
						value="" size="17">
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					电子邮件：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" validType="email"
						value="" size="17">
				</dt>
			</dl>
		</div>
		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					传真：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" validType="fax" value="" size="17">
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					通讯地址：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" value="" validType="length[0,50]" size="17">
				</dt>
			</dl>
		</div>
		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					邮编：
				</dt>
				<dt class="dt2">
					<input class="easyui-validatebox" type="text" validType="zip" value="" size="17">
				</dt>
			</dl>
		</div>
		

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					批准生产时间：
				</dt>
				<dt class="dt2"><!--138px -->
					<input class="easyui-datebox"style="width:140px;" editable="false" type="text" value="" size="17">
				</dt>
			</dl>
		</div>
		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					环评审批时间：
				</dt>
				<dt class="dt2"><!--138px -->
					<input class="easyui-datebox" style="width:140px;" required="" editable="false" value="" />
				</dt>
			</dl>
		</div>


		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					开工时间：
				</dt>
				<dt class="dt2"><!--138px -->
					<input class="easyui-datebox" style="width:140px;" editable="false" value=""></input>
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					竣工时间：
				</dt>
				<dt class="dt2"><!--138px -->
					<input class="easyui-datebox"style="width:140px;" editable="false" value=""></input>
				</dt>
			</dl>
		</div>

		<div class="pop_col_area">
			<dl>
				<dt class="dt1">
					保密要求：
				</dt>
				<dt class="dt2">
					<textarea class="easyui-validatebox" rows="4" cols="53" validType="length[0,255]"></textarea>
				</dt>
			</dl>
		</div>

		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					提供环评：
				</dt>
				<dt class="dt2">
					<input type="radio" checked="true" class="radio" name="xx1" value="0" > 否 &nbsp;&nbsp;
					<input type="radio" name="xx1" class="radio"  value="1" > 是
				</dt>
			</dl>
		</div>
		<div class="pop_col_two">
			<dl>
				<dt class="dt1">
					提供批复：
				</dt>
				<dt class="dt2">
					<input type="radio" checked="true"  class="radio" name="xx2" value="0" > 否 &nbsp;&nbsp;
					<input type="radio" name="xx2"  class="radio"  value="1"> 是
				</dt>
			</dl>
		</div>

		<div class="pop_col_area">
			<dl>
				<dt class="dt1">
					备注：
				</dt>
				<dt class="dt2">
					<textarea class="easyui-validatebox" rows="4" cols="53"
						validType="length[0,255]"></textarea>
				</dt>
			</dl>
		</div>

	</div>
</body>
</html>

   