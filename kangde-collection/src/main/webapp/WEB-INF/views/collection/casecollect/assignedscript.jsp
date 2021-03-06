<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ tagliburi="http://shiro.apache.org/tags" prefix="shiro" %>
<script type="text/javascript" charset="utf-8">
	var _datagrid;
	var _color_form;
	var _color_dialog;
	var _search_form;
	var _dialog;
	var division_dialog;
	var baseUrl = ctx + "/collection/casecollect";
	$(function() {
		loadEntrust('#search_entrustId', 'all');
		_search_form = $('#_search_form').form();
		statistics($.serializeObject(_search_form));
		_datagrid = $('#_datagrid')
				.datagrid(
						{
							url : baseUrl + '/query?scope=assigned',
							fit : true,
							method : 'POST',
							pagination : true,//底部分页
							rownumbers : true,//显示行数
							resizeHandle: 'both',
							queryParams:$.serializeObject(_search_form),
							singleSelect : false,
							fitColumns : false,//自适应列宽
							striped : true,//显示条纹
							remoteSort : true,//是否通过远程服务器对数据排序
							idField : 'id',
						     frozenColumns: [
						            [
						                {field: 'id', checkbox: true},
						                <shiro:hasPermission name="case:caseAttach">
						                {field:'operator',title:'操作',align:'center',width:80,
						                	formatter:function(value, row, index){
						        				return '<span style="text-decoration: underline;"  onclick=attachmentManager("'+row.id+'");return false;>附件</span>';
						                	}
						            	}
						                </shiro:hasPermission>
						            ]
						        ],
							toolbar : [
										<shiro:hasPermission  name="mycase:markcolor">	
										{
											text : '案件标色',
											iconCls : 'eu-icon-biaose',
											handler : function() {
												markCase();
											}
										}, 
									
										</shiro:hasPermission>     
										<shiro:hasPermission  name="mycase:comment:markcolor">	
										{
											text : '评语标色',
											iconCls : 'eu-icon-biaose',
											handler : function() {
												showCommentDialog_case();
											}
										}, 
										</shiro:hasPermission>     

									],
							columns : [ [
									{
										field : 'state',
										title : '案件状态',
										width : 95,
										sortable:true,
										formatter : function(value, row, index) {
											return app.dictName('CASE_STATE',
													value)
										}
									},
									{
										field : 'collecStateId',
										title : '风控状态',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											return app.dictName('CS_STATE',
													value)
										}
									},
									{
										field : 'caseCode',
										title : '案件序列号',
										sortable : true,
										width : 180,
										formatter : function(value, row, index) {
											if (row.state == 1) { //1为暂停状态， 不允许查看详情
												return value;
											}
											return '<span style="text-decoration: underline;cursor:pointer" onclick=window.open("${pageContext.request.contextPath}/collection/casedetail?caseId='
													+ row.id
													+ '")>'
													+ value
													+ '</span>';
										}
									},
									{
										field : 'batchCode',
										title : '批次号',
										sortable : true,
										width : 120,
										formatter : function(value, row, index) {
											if (row.state == 1) { //1为暂停状态， 不允许查看详情
												return value;
											}
										   return openBatchPage(value, row, index)																		//batchId, batchCode, typeId,entrustId,beginDate,endDate,target,handle,remark
										}
									},
									{
										field : 'caseName',
										title : '姓名',
										sortable : true,
										width : 95
									},
									{
										field : 'caseNum',
										title : '证件号',
										sortable : true,
										width : 180
									},
									{
										field : 'caseCard',
										title : '卡号',
										width : 180,
										sortable : true,
									},
									{
										field : 'mobile1',
										title : '手机号1',
										width : 95
									},
									{
										field : 'mobile2',
										title : '手机号2',
										width : 95
									},
									{
										field : 'entrustName',
										title : '委托方',
										width : 120,
										sortable : true,
									},
									{
										field : 'caseDate',
										title : '委案日期',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											if (value) {
												return $.formatDate(value,
														'yyyy-MM-dd');
											}
											return value;
										}
									},
									{
										field : 'caseBackdate',
										title : '退案日期',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											if (value) {
												return $.formatDate(value,
														'yyyy-MM-dd');
											}
											return value;
										}
									},
									{
										field : 'caseMoney',
										title : '委案金额',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											return $.fmoney(value);;
										}
									},
									{
										field : 'surplusMoney',
										title : '剩余还款',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											return $.fmoney(value);
										}
									},
									{
										field : 'ptpMoney',
										title : 'PTP金额',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											return $.fmoney(value);
										}
									},
									{
										field : 'cpMoney',
										title : 'CP金额',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											return $.fmoney(value);
										}
									},
									{
										field : 'paidNum',
										title : '已还款',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											return $.fmoney(value);
										}
									},
									{
										field : 'agentRate',
										title : '业绩率',
										width : 60,
										formatter : function(value, row, index) {
											if(!value){
						    					return '0.00';
						    				}
						    				return value;
										}
									},
									{
										field : 'brokerage',
										title : '业绩',
										width : 95,
							
										formatter : function(value, row, index) {
											if(row.agentRate && row.paidNum){
						    					return fmmoney(row.agentRate*row.paidNum);
						    				}
						    				return '0.00';
										}
									},
								/* 	{
										field : 'overdueDays',
										title : '逾期天数',
										width : 100

									}, */
									{
										field : 'lastPhone',
										title : '最后通电时间',
										width : 95,
										sortable : true,
										formatter : function(value, row, index) {
											if (value) {
												return $.formatDate(value,
														'yyyy-MM-dd HH:mm:ss');
											}
											return value;
										}
									}] ],
							onLoadSuccess : function() {
								$(this).datagrid('showTooltip').datagrid('columnMoving');
								app.unCheckAll(this);//取消所有选中
							},
							
							rowStyler: function(index,row){
					            var color=app.dictName('CASE_COLOR',row.color);
					            if(!color){
					            	color='none';
					            }
					            var rowstyle='color:'+color;
					            if(row.state==3){
					            	rowstyle+=';color:#CACACA;text-decoration:line-through;'
					            }
					    		return rowstyle;
					    	}

						});

	});

	
	//搜索
	function search() {
		var params = $.serializeObject(_search_form);
		//重新加载datagrid
		app.load(_datagrid, params);
		statistics(params);
	}
	//统计
	function statistics(params) {
		//统计重置
		$.ajax({
			url : baseUrl + "/statistics?scope=assigned",
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				//渲染结果
				app.renderAjax(data, function(json) {
					var obj = json.obj;
					$('#total_case_count').html(obj.total_case_count);
					$('#total_case_money').html(obj.total_case_money);
					$('#already_case_count').html(obj.already_case_count);
					$('#total_already_money').html(obj.total_already_money);
					$('#total_cp_money').html(obj.total_cp_money);
					$('#total_ptp_money').html(obj.total_ptp_money);
				}, false);
			}
		});
	}

	//附件管理
	function attachmentManager(caseId) {
		var href = ctx
				+ '/collection/upload/index?action=edit&&businessType=bankCase&&businessId='
				+ caseId;
		var content = '<iframe scrolling="no" frameborder="0"  src="' + href
				+ '" style="width:100%;height:100%;"></iframe>';
		window.open(href);
	}

	//委托方 
	function loadEntrust(domId, type) {
		var url = ctx + '/sys/entrust/combobox?selectType=' + type;
		$(domId).combobox({
			url : url,
			multiple : false,//是否可多选
			editable:true,//是否可编辑
			width : 150,
			valueField : 'value',
			textField : 'text'
		});
	}

	//统计
	function statistics(params) {
		//统计重置
		$.ajax({
			url : baseUrl + "/statistics?scope=assigned",
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				//渲染结果
				app.renderAjax(data, function(json) {
					var obj = json.obj;
					$('#total_case_count').html(obj.total_case_count);
					$('#total_case_money').html(obj.total_case_money);
					$('#already_case_count').html(obj.already_case_count);
					$('#total_already_money').html(obj.total_already_money);
					$('#total_cp_money').html(obj.total_cp_money);
					$('#total_ptp_money').html(obj.total_ptp_money);
					$('#total_brokerage').html(obj.total_brokerage);
				}, false);
			}
		});
	}

	//加载组织机构
	function loadOrgs() {
		var url = ctx + '/sys/organization/parentOrganization';
		$('#orgId').combotree({
			url : url,
			multiple : false,//是否可多选
			editable : false,//是否可编辑
			width : 145,
			valueField : 'id',
			value : '${CURRENT_USER.orgId}'
		});
	}
	
	
		function markCase(){
			app.dataGridSelect(_datagrid, function(rows) {
				var ids = new Array();
		        $.each(rows, function (i, row) {
		        	ids[i] = row.id;
		        });
		        var inputUrl = ctx+"/collection/case/mark";
				//弹出对话窗口,保存按钮函数,标题,宽度,高度,请求路径,请求方式,表单加载数据函数（可以为空）
				_color_dialog = app.openFormDialog(function() {

					$.messager.progress({
						title : '提示信息！',
						text : '数据处理中，请稍后....'
					});
					
					$.ajax({
						type : 'post',
						url : ctx+"/collection/case/updateColor",
						data : {
							"ids" : ids,
							"color":$("input[name=color]:checked").val()
						},
						dataType : 'json',
						success : function(data) {
							$.messager.progress('close');
							//渲染结果
							app.renderAjax(data, function(json) {
								_color_dialog.dialog('destroy');//销毁对话框
								app.reload(_datagrid);//重新加载列表数据
							});
						}
					});
				}, '案件标色', 500,160, inputUrl, 'GET', function() {
					
				});
			});
		}
		
		
		
		
	
		
		function openBatchPage(value, row, index){
			return '<span style="text-decoration: underline;cursor:pointer" onclick=findRowClick("'+row.batchId+'")>'
			+ value
			+ '</span>'
		}

		function findRowClick(batchId){
			
			var rows=_datagrid.datagrid("getRows")
			for (var i=0,len=rows.length; i<len; i++)
			{
				var row=rows[i];
				if(row.batchId==batchId){
					
					 $.ajax({
					        type: "GET",
					        url: ctx + '/collection/casebatch/'+batchId,
					        data: {},
					        dataType: "json",
					        success: function(data){
								viewBatch(batchId, data.batchCode, data.typeId,data.entrustId,data.beginDate,data.endDate,data.target,data.handle,data.remark)
					        }
					    });
					break;
				}
			}
		}



		function viewBatch(batchId, batchCode, typeId,entrustId,beginDate,endDate,target,batchHandle,remark) {

			batchUrl= ctx + "/collection/caseImport/show?id="+batchId
			app.openViewDialog('批次详情', 600, 400, batchUrl, 'GET', function(){
				$('#entrustId').combobox({
			        url:ctx+'/sys/entrust/combobox',
				    multiple:false,//是否可多选
				    editable:false,//是否可编辑
				    width:150,
				    valueField:'value',
			        textField:'text'
				});
				if(typeId){
					$("#typeId").combobox('setValue', typeId).combobox('readonly', true);
				}
				$("#typeId").combobox('readonly', true);
				
				if(entrustId){
					$("#entrustId").combobox('setValue',entrustId).combobox('readonly', true);
				}
				$("#entrustId").combobox('readonly', true);
				
				if(beginDate){
					
					$("#begin").datebox('setValue', $.formatDate(beginDate,'yyyy-MM-dd')).datebox('readonly', true);
				}
				$("#begin").datebox('readonly', true);
				
				if(target){
					$("#target").textbox('setValue', target).textbox('readonly', true);
				}
				$("#target").textbox('readonly', true);
				
				if(endDate){
					$("#end").datebox('setValue', $.formatDate(endDate,'yyyy-MM-dd')).datebox('readonly', true);
				}
				$("#end").datebox('readonly', true);
				
				if(batchCode){
					$("#batchCodeview").textbox('setValue', batchCode).textbox('readonly', true);
				}
				$("#batchCodeview").textbox('readonly', true);
				
				if(batchHandle){
					$("#handle").combobox('setValue', batchHandle).combobox('readonly', true);
				}
				$("#handle").combobox('readonly', true);
				
				if(remark){
					$("#remark").textbox('setValue', remark).textbox('readonly', true);
				}
				$("#remark").textbox('readonly', true);
				
				
		   	});
		}


</script>
