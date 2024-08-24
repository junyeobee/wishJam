<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<meta charset="UTF-8">
<title>배송지 변경</title>
<style>
        fieldset {
            border: 2px solid #f5e6d6;
            border-radius: 8px;
            padding: 20px;
            width: 100%;
            height: 100%;
            max-width: 500px;
            max-height: 250px;
            background-color: #fdf5e6;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            box-sizing: border-box;
            font-family: 'Cafe24Ohsquareair';
        }

        legend {
            font-size: 1.2em;
            font-weight: bold;
            padding: 0 10px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 1.1em;
            color: #555;
            font-family: 'Pretendard-Regular';
        }
        
		.button-container {
            text-align: right;
            padding-right: 25px;
        }
        
        input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 12px;
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
	      <label>주소</label>
	      <input type="text" name="useraddr">
	      <div class="button-container">
	      	<input type="submit" value="주소변경">
	      </div>
	   </fieldset>
	</form>
</body>
</html>