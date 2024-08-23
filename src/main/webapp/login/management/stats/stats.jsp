<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = "ㅎㅇ";
%>
<head>
<style>
	.chart {
	    display: flex;
	    align-items: flex-end;
	    border-left: 2px solid #000;
	    border-bottom: 2px solid #000;
	    padding: 10px;
	    height: 400px;
	    width: 600px;
	    background-color: #f0f0f0;
	}
	.bar {
	    width: 50px;
	    margin: 0 10px;
	    background-color: blue;
	    text-align: center;
	    color: white;
	    font-size: 14px;
	    box-sizing: border-box;
	}
	.bar-label {
	    margin-top: 5px;
	}
</style>
</head>
<div>
	<h1>통계</h1>
	<div id="barChart" class="chart"></div>
	<script src="script.js"></script>
</div>