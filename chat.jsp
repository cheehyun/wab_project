<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>세시소프트</title>
</head>
<body>
    <% 
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
    %>
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main.jsp">메인</a></li>
                <%
                    if(userID == null) {
                %>
                <li><a onclick="alert('로그인 후 사용이 가능합니다.');" style="cursor:pointer">공지사항</a></li>
                <%
                    } else {
                %>
                <li><a href="bbs.jsp">공지사항</a></li>
                <%
                    }
                %>
                <li><a href="c_i.jsp">회사 연혁</a></li>
            </ul>
            <%
                if (userID == null) {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">서비스 이용하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
            <%
                } else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false"><%= userID %>님 환영합니다<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                        <li><a href="">회원정보 변경</a></li>
                        <li><a href="chat.jsp">메시지</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>
    <h1>코드 채팅 페이지</h1>
    
    <!-- 코드 표시 영역 -->
    <div id="code-box">
        <!-- 여기에 코드를 동적으로 추가할 것입니다. -->
    </div>

    <!-- 코드 입력 폼 -->
    <form id="code-form">
        <textarea id="code" class="form-control" placeholder="코드를 입력하세요"></textarea>
        <button type="submit" id="send-code-button">전송</button>
    </form>

    <!-- 의견 표시 영역 -->
    <div id="comment-box">
        <!-- 여기에 코드에 대한 의견을 동적으로 추가할 것입니다. -->
    </div>

    <!-- 의견 입력 폼 -->
    <form id="comment-form">
        <input type="text" id="comment" class="form-control" placeholder="의견을 입력하세요">
        <button type="submit" id="send-comment-button">의견 전송</button>
    </form>

    <p>외부 링크 예제: <span class="external-link" onclick="openExternalLink('https://www.example.com')">https://www.example.com</span></p>

    <script>
        // 코드를 표시하는 함수
        function displayCode(code) {
            const codeBox = document.getElementById('code-box');
            const codeDiv = document.createElement('pre');
            codeDiv.textContent = "<%= userID %> : " + code; // 사용자 ID를 코드 앞에 추가
            codeBox.appendChild(codeDiv);

            // 새 코드가 추가될 때 스크롤을 아래로 이동
            codeBox.scrollTop = codeBox.scrollHeight;
        }

        // 코드 전송 이벤트 핸들러
        document.getElementById('code-form').addEventListener('submit', function (e) {
            e.preventDefault();
            const codeInput = document.getElementById('code');
            const code = codeInput.value.trim();

            if (code !== '') {
                // 코드를 표시하고 입력 필드 비우기
                displayCode(code);
                codeInput.value = '';
            }
        });

        // 의견을 표시하는 함수
        function displayComment(comment) {
            const commentBox = document.getElementById('comment-box');
            const commentDiv = document.createElement('div');
            commentDiv.textContent = "<%= userID %> : " + comment; // 사용자 ID를 의견 앞에 추가
            commentBox.appendChild(commentDiv);

            // 새 의견이 추가될 때 스크롤을 아래로 이동
            commentBox.scrollTop = commentBox.scrollHeight;
        }

        // 의견 전송 이벤트 핸들러
        document.getElementById('comment-form').addEventListener('submit', function (e) {
            e.preventDefault();
            const commentInput = document.getElementById('comment');
            const comment = commentInput.value.trim();

            if (comment !== '') {
                // 의견을 표시하고 입력 필드 비우기
                displayComment(comment);
                commentInput.value = '';
            }
        });

        // 외부 링크를 열기 위한 함수
        function openExternalLink(link) {
            window.open(link, '_blank');
        }
    </script>
</body>
</html>
