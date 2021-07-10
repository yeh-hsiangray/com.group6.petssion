<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
  <head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css">
    <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js"></script>
    <script src="https://unpkg.com/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
  </head>
  <body>
    <div class="container">
      <ul class="nav nav-tabs">
        <li><a href="#home" data-toggle="tab">首頁</a></li>
        <li><a href="#board" data-toggle="tab">留言板</a></li>
        <li><a href="#download" data-toggle="tab">下載區</a></li>
        <li><a href="#config" data-toggle="tab">設定</a></li>
      </ul>
      <div class="tab-content" style="padding:10px;">
        <div class="tab-pane active" id="home">
          <p>這是首頁</p>
        </div>
        <div class="tab-pane" id="board">
          <p>這是留言板</p>
        </div>
        <div class="tab-pane" id="download">
          <p>這是下載區</p>
        </div>
        <div class="tab-pane" id="config">
          <p>這是設定</p>
        </div>
      </div>
    </div>
    <script>
      $(document).ready(function(){
        });
    </script>
  </body>
</html>