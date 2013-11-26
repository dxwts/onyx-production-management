function set_data(el, ctrl) {
	var objectId;
	var name;
	objectId = $(el.children()[0]).html();
	onyx_p_n = $(el.children()[1]).html();
	$("#materiale_name").text(onyx_p_n);
	$("#materiale_id").val(objectId);
	$("#materiale_ctrl").val(ctrl);
	console.log($("#materiale_ctrl").val());
	if (ctrl === "plus") {
		$("#myModalLabel").text("添加物料");
	} else {
		$("#myModalLabel").text("减少物料");
	}
}

function update_materiale() {
	var materiale_id;
	var materiale_event;
	var materiale_quantity;
	var materiale_remark;
	var materiale_ctrl;
	materiale_id = $("#update_materiale #materiale_id").val();
	materiale_event = $("#update_materiale #materiale_event").val();
	materiale_quantity = $("#update_materiale #materiale_quantity").val();
	materiale_remark = $("#update_materiale #materiale_remark").val();
	materiale_ctrl = $("#update_materiale #materiale_ctrl").val();
	if (materiale_ctrl === "minus") {
		materiale_quantity = -(materiale_quantity);
	}
	var params = {
		"id" : materiale_id,
		"event" : materiale_event,
		"quantity" : materiale_quantity,
		"remark" : materiale_remark
	};
	console.log(params);
	$.get('/materiales/update_materiale', params, function(data) {
		location.reload();
	});
}

function search() {
	var search_category;
	var search_params;
	search_category = $("#search_category").val();
	search_params = $("#search_params").val();
	var params = {
		"search_category" : search_category,
		"search_params" : search_params
	};
	console.log(params);
	$.get('/materiales/search_materiales', params, function(data) {
		// location.reload();
		console.log(data);
	});

}
