<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qnacontent</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".b_slide").click(function() {
			if ($(".ul_slide").is(":visible")) {

				$(".ul_slide").slideUp();
			} else {
				$(".ul_slide").slideDown();
			}
		});
	});
</script>
<style type="text/css">
.b_slide {
	cursor: pointer;	
}
</style>
</head>
<body>
	<h1>Q & A</h1>
	<p>자주 묻는 사항들을 게시한 페이지 입니다.</p>
	<table style="width: 600px;">
		<tbody>
			<tr> 
                    <th scope="row">행사일</th> 
                    <td> 
                        <select name='d_year' class='frm_input' itemname='년'> 
                            <option value=""></option> 
                            <?php 
                            $k = date("Y"); 
                            $j = date("Y") + 3; 
                            for($i=$k; $i<$j; $i++) { 
                            echo "<option value='{$i}'"; 
                            if($d_year == $i) { echo " selected='selected'"; } else { } 
                            echo ">{$i}</option>"; 
                            } 
                            ?> 
                        </select>년 
                        <select name='d_month' class='frm_input' itemname='월'> 
                            <option value=""></option> 
                            <?php 
                            for($i=1; $i<13; $i++) { 
                            echo "<option value='{$i}'"; 
                            if($d_month == $i) { echo " selected='selected'"; } else { } 
                            echo ">{$i}</option>"; 
                            } 
                            ?> 
                        </select>월 
                        <select name='d_day' class='frm_input' itemname='월'> 
                            <option value=""></option> 
                            <?php 
                            for($i=1; $i<32; $i++) { 
                            echo "<option value='{$i}'"; 
                            if($d_day == $i) { echo " selected='selected'"; } else { } 
                            echo ">{$i}</option>"; 
                            } 
                            ?> 
                        </select>일 
                    </td> 
                </tr>  

                <?php include_once(G5_PLUGIN_PATH.'/jquery-ui/datepicker.php'); ?> 
                <script> 
                    $(function(){ 
                        $("#datepicker_from, #datepicker_to").datepicker({ 
                            changeMonth: true, 
                            changeYear: true, 
                            dateFormat: "yy-mm-dd", 
                            showButtonPanel: true, 
                            yearRange: "c-99:c+99", 
                            maxDate: "+365d" 
                        }); 
                    }); 
                </script> 
                <tr> 
                    <th scope="row">행사일</th> 
                    <td> 
                        <input type="text" name="wr_1" class="frm_input" style="width:72px;" readonly id="datepicker_from" value="<?php echo $write["wr_1"]; ?>"> ~ 
                        <input type="text" name="wr_2" class="frm_input" style="width:72px;" readonly id="datepicker_to" value="<?php echo $write["wr_2"]; ?>"> 
                    </td> 
                </tr>

		</tbody>

	</table>
	
	
	
</body>
</html>