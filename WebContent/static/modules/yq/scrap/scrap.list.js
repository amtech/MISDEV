$(document).ready(function() {
	$(".wxsqdhlable").css({
		"width" : "200px"
	});
	$(".dqztlable").css({
		"width" : "80px"
	});
	// 借用申请审批，通过
	onSubmitx("approveForm", function(form) {
		confirmx("确认审批通过？", function() {
			$("input[type='submit']", form).button("loading");
			loading('正在提交，请稍等...');
			form.submit();
		});
	});
	// 借用申请审批，拒绝
	onSubmitx("denyForm", function(form) {
		confirmx("确认审批拒绝？", function() {
			$("input[type='submit']", form).button("loading");
			loading('正在提交，请稍等...');
			form.submit();
		});
	});
});
function page(n, s) {
	$("#pageNo").val(n);
	$("#pageSize").val(s);
	$("#searchForm").submit();
	return false;
}
function approve(id, dqzt) {
	$("#id1").val(id);
	$('#approveModal').modal();
}
// 审批拒绝
function deny(id, dqzt) {
	$("#id2").val(id);
	$('#denyModal').modal();
}
