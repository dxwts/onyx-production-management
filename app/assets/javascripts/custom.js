function set_data (el, ctrl) {
    var objectId;
    var name;
    objectId = $(el.children()[0]).html();
    name = $(el.children()[1]).html();
    $("#materiale_name").text(name);
    $("#materiale_id").val(objectId);
    $("#materiale_ctrl").val(ctrl);
    console.log($("#materiale_ctrl").val());
    if (ctrl === "plus") {
        $("#myModalLabel").text("Add Materiales");
    } else {
        $("#myModalLabel").text("Minus Materiales");
    }
}

function update_materiale () {
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
    var params = {"id" : materiale_id, "event" : materiale_event, "quantity" : materiale_quantity, "remark" : materiale_remark};
    console.log(params);
     $.get('/materiales/update_materiale', params);
}