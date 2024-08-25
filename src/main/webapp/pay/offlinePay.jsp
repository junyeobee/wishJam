<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.pay.wishJam.PayDAO"></jsp:useBean>
<%
	String sidx = "1";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시잼 - 현장결제</title>
<style>
	body {
		    background-color: #fdf5e6;
			display: flex;
		    justify-content: center;
		    align-items: center;
		    min-height: 90vh;
		    margin: 0;
		}	
		
	.button-container {
            text-align: right;
            padding-top: 8px;
            padding-right: 25px;
            padding-bottom: 13px;
        }
        
	input[type="submit"] {
            background: #ff6f40;
            border: none;
            color: #fff;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pretendard-Regular';
        }
        
    input[type="submit"]:hover {
            background-color: #e03a00;
        }
</style>
</head>
<body>
	<%
		String[] offlist = pdao.offline(sidx);
	%>
	<div>
		<label>장소</label>
		<span><%=offlist[0] %></span>
	</div>
	<div>
		<label>시간</label>
		<select>
			<%!	
				String formatTime (String timeStr) {
		            if (timeStr.length() == 4) { 
		                return timeStr.substring(0, 2) + ":" + timeStr.substring(2);
		            } else if (timeStr.length() == 3) { 
		                return timeStr.substring(0, 1) + ":" + timeStr.substring(1);
		            } else if (timeStr.length() == 2) { 
		                return "0:" + timeStr;
		            } else if (timeStr.length() == 1) { 
		                return "00:" + timeStr;
		            }
		            return timeStr; 
		        }
			%>
			<%				
				if(offlist[1].equals("오전")){
					int	hour1 = Integer.parseInt(offlist[2]);
				} else if(offlist[1].equals("오후")) {
					int hour1 = Integer.parseInt(offlist[2]+1200);
				}
				
				if(offlist[3].equals("오전")){
					int hour2 = Integer.parseInt(offlist[4]);
				} else if(offlist[3].equals("오후")) {
					int hour2 = Integer.parseInt(offlist[4]+1200);
				}
				
				for(int i = hour1; i <= hour2; i += 200){
			%>
				<option value="<%=i%>"><%=formatTime(Integer.toString(i)) %></option>
			<%
				}
			%>

		</select>
	</div>
	<div class="button-container">
	   <input type="submit" value="거래신청">
	</div>
</body>
</html>