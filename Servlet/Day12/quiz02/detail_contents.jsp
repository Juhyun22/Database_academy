<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
// 아이유 노래 리스트 
    List<Map<String, Object>> musicList = new ArrayList<>();

    Map<String, Object> musicInfo = new HashMap<>();
    musicInfo.put("id", 1);
    musicInfo.put("title", "팔레트");
    musicInfo.put("album", "Palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 2);
    musicInfo.put("title", "좋은날");
    musicInfo.put("album", "Real");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
    musicInfo.put("time", 233);
    musicInfo.put("composer", "이민수");
    musicInfo.put("lyricist", "김이나");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 3);
    musicInfo.put("title", "밤편지");
    musicInfo.put("album", "palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 253);
    musicInfo.put("composer", "제휘,김희원");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 4);
    musicInfo.put("title", "삐삐");
    musicInfo.put("album", "삐삐");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/111/535/81111535_1539157728291_1_600x600.JPG");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "이종훈");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 5);
    musicInfo.put("title", "스물셋");
    musicInfo.put("album", "CHAT-SHIRE");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/080/724/877/80724877_1445520704274_1_600x600.JPG");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 6);
    musicInfo.put("title", "Blueming");
    musicInfo.put("album", "Love poem");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);
%>

<%
	// 상세 곡 정보를 보여줄 target Map 세팅 
	Map<String, Object> target = null;    // {}

	// 1. 목록에 클릭해서 들어온 경우(a 태그) - id값 
	if (request.getParameter("id") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		for (Map<String, Object> music : musicList) {
			if (id == (int)music.get("id")) {
				target = music;
				break;
			}
		}
	}
	
	// 2. search 검색어로 유입되는 경우 
	if (request.getParameter("search") != null) {
		String search = request.getParameter("search");
		
		for (Map<String, Object> music : musicList) {
			String title = (String)music.get("title");
			if (title.equals(search)) {
				target = music;
				break;
			}
		}
	}

%>

<div class="contents">
	<%
		if (target != null) {
	%>
	<p class="font-weight-bold"><h4>곡 정보</h4></p>
	<section class="song-information">
		<div class="border border-success h-100 d-flex p-3">
			<div class="album-img">
				<img src="<%= target.get("thumbnail") %>" alt="앨범_썸네일" height="180px">
			</div>
			<div class="album-info d-flex flex-column m-2">
				<div class="display-4"><%= target.get("title") %></div>
				<div class="text-success font-weight-bold"><%= target.get("singer") %></div>
				<div class="d-flex">
					<div class="text-secondary">
						<small>앨범</small><br>
						<small>재생시간</small><br>
						<small>작곡가</small><br>
						<small>작사가</small>
					</div>
					<div class="text-secondary ml-4">
						<small><%= target.get("album") %></small><br>
						<small><%= (int)target.get("time")/60 %> : <%= (int)target.get("time")%60 %></small><br>
						<small><%= target.get("composer") %></small><br>
						<small><%= target.get("lyricist") %></small>
					</div>
				</div>
			</div>	
		</div>
	</section>
	<br><br>
	<p class="font-weight-bold"><h4>가사</h4></p>
	<hr>
	<section class="song-list">
		<div>가사 정보 없음</div>
	</section>
	<%
		} 
		else {
	%>
		<h1>찾는 정보 없음</h1>
	<%	
		}
	%>
</div>
