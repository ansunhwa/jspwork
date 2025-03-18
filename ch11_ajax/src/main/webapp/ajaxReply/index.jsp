<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 댓글달기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	* {magin:0 auto;}
	body {text-align:center;}
	img {width:500px;}
	table{border:1px solid; border-collapse: collapse;}
</style>
</head>
<body>
	<img src="img02.jpg">
	<br><br>
	<table style="margin-left: auto; margin-right: auto; ">
		<thead>
			<tr>
				<th>댓글 작성</th>
				<td>
					<textarea rows="3" cols="50" id="content"></textarea>
				</td>
				<td><input type="button" id="btn1" value="댓글등록"></td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<script>
	$(()=> {
		replyList();
		// setInterval(replyList, 1000);
	})
	
	
	function reqlylist() {
		$.ajax({
			url : "rlist.bo",
			data: {bnum: 1},   //그림1에 대한 댓글만 있음
			success: function(list) {
				let value = "";
				for(let i=0; i<list.length; i++) {
					 value += "<tr>"
						+ "<td>" + list[i].name + "</td>"
						+ "<td>" + list[i].content + "</td>"
						+ "<td>" + list[i].rdate + "</td>"
						+ "</tr>";
				}	
				$('#table tbody').html(value);
				
			},
			error: function() {
				console.log("ajax통신 실패");
			}
		})
	}
	
	$(() => {
		$('#btn1').click(function(){
			$.ajax({
				url: "rInset.bo",
				data: {
					content: $('#content').val(),
					bnum: 1,
					name: "이떙땡"
				},
				type: "post",
				success: function(result) {
					if(result > 0) {
						replyList();
					}	
				},
				error: function() {
					console.log("ajax통신 실패");
				}
			})
		})
		
			
		
	})
	</script>

</body>
</html>