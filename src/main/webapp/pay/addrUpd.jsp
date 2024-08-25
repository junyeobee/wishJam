<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<meta charset="UTF-8">
<title>배송지 변경</title>
	<style>
		body {
			background-color: #fdf5e6;
			display: flex;
		    justify-content: center;
		    align-items: center;
		    min-height: 90vh;
		    margin: 0;
		}
		
        fieldset {
            border: 2px solid #faf9f6;
            border-radius: 8px;
            padding: 20px;
            width: 500px;
            height: 190px;
            background-color: #faf9f6;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            box-sizing: border-box;
            margin: auto;
            font-family: 'Cafe24Ohsquareair';
        }

        legend {
            font-size: 1.2em;
            font-weight: bold;
            padding: 0 10px;
            color: #ff4500;
        }
        
		.button-container {
            text-align: right;
            padding-top: 8px;
            padding-right: 25px;
            padding-bottom: 13px;
        }
        
        input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 12px;
            font-family: 'Pretendard-Regular';
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
	<form name="addrUpdate" action="addrUpdate.jsp">
	   <fieldset>
	      <legend>배송지 변경</legend>
	      <div class="button-container"></div>
	      <input type="text" name="useraddr" placeholder="예시: 서울특별시 강남구 xx로 xx길 12-3">
	      <div class="button-container">
	      	<input type="submit" value="주소변경">
	      </div>
	   </fieldset>
	</form>
</body>
</html>