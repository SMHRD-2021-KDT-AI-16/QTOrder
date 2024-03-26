<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>QTOrder</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/yg.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        
        <style type="text/css">
        	#empty{
        		width: 100%;
        		height: 5%;
        	}
        	#map{
        	
        		width: 100%;
        		height: 60%;
        	}
        	#waypoint_list{
        		background-color:white;
        		width: 100%;
        		height: 35%;
        		max-height: 35%;
    			overflow-y: auto;
        	}
        	.way_loc{
        		display: none;
        	}
        	.waydiv {
    			display: inline-block;
    			padding-left: 20px;
    			padding-top: 30px;
    			padding-bottom: 30px;
			}
			.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
        </style>
    </head>
<body style="background-color: #FA823C">
    <div id="qtlayer-up" class="qtlayer-up" style="display: flex; justify-content: center; align-items: center;">
    <div style="text-align: center;">
    <div style="display: inline-block;">
        <a class="btn" href="storelist.do"><i data-feather="shopping-bag" style="font-size: 24px;"></i>����</a>
    </div>
    <div class="separator"></div>
    <div style="display: inline-block;">
        <a class="btn" href="getmap.do"><i data-feather="map-pin" style="font-size: 24px;"></i>����</a>
    </div>
    <div class="separator"></div>
    <div style="display: inline-block;" class="dropdown">
    <button id="dropdownMenuButton" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button"><i data-feather="file-text" style="font-size: 24px;"></i>�ֹ�</button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    	<a class="dropdown-item" href=".do">�ֹ���Ȳ</a>
        <a class="dropdown-item" href="getreceipt.do">������</a>
        </div>
    </div>
	</div>
</div>
<div id="empty"></div>

<div id="map"></div>
<div id="waypoint_list">
	<c:forEach var="x" items="${fes_user_view}">
		<div id="ft_list">
        	<div class="h3 waydiv">${x.getFt_name()}</div>
            <div class="waydiv">${x.getFes_loc_name()}</div>
            <input id="" class="way_loc" value="${x.getFes_loc_lat()}">
            <input id="" class="way_loc" value="${x.getFes_loc_lng()}">
		</div>
		<hr class="m-0" />
	</c:forEach>
</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e193c7f773c86ecc8ab769e9704f781a&libraries=services,drawing"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script type="text/javascript">
window.onload = function() {
	currentLocation();
};

let lat = 34.81183091553852;
let lng = 126.3922304333026;
var markers = [];


function currentLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            lat = position.coords.latitude;
            lng = position.coords.longitude;
			console.log('lat ',lat,' lng ',lng);
            var map = createMap(lat, lng);
            addClickListener(map);
        });
    } else {
        // ��ġ ������ �޾ƿ��� ���� ��쿡 ���� ó��
    }
    return true;
}

function createMap(lat, lng) {
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(lat, lng),
        level: 2
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 
	
	//��Ŀ�� �����մϴ�
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});
	
	markers.push(marker);
	setMarkers(map);
	console.log("markers ", markers);
	return map
}

function addClickListener(map) {
    document.querySelectorAll('#waypoint_list>#ft_list').forEach(div => {
        div.addEventListener('click', function() {
            const lat = this.querySelector('.way_loc:nth-child(3)').value;
            const lng = this.querySelector('.way_loc:nth-child(4)').value;
            addMarker(map, lat, lng); 
            console.log('Latitude: ', lat, 'Longitude: ', lng);
        });
    });
}

function addMarker(map, lat, lng) {
    // ������ �߰��� ������ ��Ŀ�� �����մϴ�.
    if (markers.length > 1) {
        var lastMarker = markers.pop();
        lastMarker.setMap(null);
    }

    var markerPosition = new kakao.maps.LatLng(lat, lng);
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // ���ο� ��Ŀ�� �迭�� �߰��մϴ�.
    markers.push(marker);

    // ����� ��Ŀ�� ������ ǥ���մϴ�.
    setMarkers(map);

    // �� ��° ��Ŀ���ʹ� ���� �׸��ϴ�.
    if (markers.length > 1) {
        drawLineAndDisplayDistance(map);
    }
}


function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}
var distanceOverlay;
var moveLine = null; // ��Ŀ�� �̾ �׸��� �� ��ü

function drawLineAndDisplayDistance(map) {
    
    var linePath = [];
    console.log("len ",markers.length);
    
    for (var i = 0; i < markers.length; i++) {
        linePath.push(markers[i].getPosition());
    }
	console.log("linpath ", linePath);
	
    // ���ο� �� ��ü ����
    var line = new kakao.maps.Polyline({
        path: linePath,
        strokeWeight: 3,
        strokeColor: '#db4040',
        strokeOpacity: 0.5,
        strokeStyle: 'solid'
    });
    
    // ������ �� ��ü ����
    if (moveLine != null) {
        moveLine.setMap(null);
    }

    // ���ο� �� ��ü ������ ǥ��
    line.setMap(map);
    moveLine = line;

    // �� ��Ŀ ������ �Ÿ� ���
    let polyline = new kakao.maps.Polyline();
	polyline.setPath([linePath[0], linePath[1]]); // ���̸� ���� ��ǥ�� path�� �������ּ���.
	console.log(polyline.getLength());
	var distance = Math.round(polyline.getLength());
    
    console.log("distance " ,distance);
    var content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">' + distance + '</span>m</div>';

    content = getTimeHTML(distance);
    // ������ ǥ�õ� �Ÿ� ���� ����
    deleteDistanceOverlay();

    // �Ÿ� ������ ǥ���ϴ� Ŀ���� �������� ���� �� ������ ǥ��
    distanceOverlay = new kakao.maps.CustomOverlay({
        map: map,
        content: content,
        position: markers[1].getPosition(),
        yAnchor: 1,
        zIndex: 2
    });
}

// ������ ǥ�õ� �Ÿ� ������ �����ϴ� �Լ�
function deleteDistanceOverlay() {
    if (distanceOverlay) {
        distanceOverlay.setMap(null);
        distanceOverlay = null;
    }
}

function getTimeHTML(distance) {

    // ������ �ü��� ��� 4km/h �̰� ������ �м��� 67m/min�Դϴ�
    var walkkTime = distance / 67 | 0;
    var walkHour = '', walkMin = '';

    // ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
    if (walkkTime > 60) {
        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>�ð� '
    }
    walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

    // �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '    <li>';
    content += '        <span class="label">�ѰŸ�</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">����</span>' + walkHour + walkMin;
    content += '    </li>';
    content += '</ul>'

    return content;
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</html>