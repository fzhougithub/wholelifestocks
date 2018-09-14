<?

//SELECT hostid FROM `hosts` WHERE host='dfkvm52.demandforce.com' 
//key: system.cpu.util[,user]

mysql_connect("dfzabbixdbx", 'zabbix', 'zabbix1');
mysql_select_db('zabbix');

$type = isset($_REQUEST['type']) ? $_REQUEST['type'] : "line";

$key = $_REQUEST['key'];
$hosts = $_REQUEST['host'];

//print "key: $key<br>\n";

$duration = isset($_REQUEST['duration']) ? $_REQUEST['duration'] : 3600*6;

$items=array();
$series= array();

foreach($hosts as $hostname) {
    $key = addslashes($key);
    $hostname = addslashes($hostname);
	$host_query = "SELECT hosts.hostid,hosts.host,itemid,key_ FROM hosts,items WHERE host LIKE '$hostname' AND hosts.hostid=items.hostid AND key_ = '$key'";
	$result = mysql_query($host_query);
	while($row = mysql_fetch_array($result)) {
	  $items[]= array('hostname'=> $row['host'], 'id'=> $row['itemid']);
    }
    
    
    //print "query: $host_query<br>\n";
}


foreach($items as $item) {

	//one hour ago;
	$clock = mktime() - $duration;
	
	
	// history can come from multiple tables, history, history_unit, history_str, or history_text
	// TODO: figure out which table dynamically
	
	$item_query = "SELECT clock, value FROM history WHERE itemid = ".$item['id']." AND clock > $clock ORDER BY clock ASC";
	$result = mysql_query($item_query);
	
	//print "query: $item_query\n";
	
	$data=array();
	while($row = mysql_fetch_array($result)) {
		
		//normalize times to the nearest minute
		$clock = floatval($row['clock']);
		$clock = $clock - ($clock % 60);
			
		$data[]=array($clock*1000, floatval($row['value']));
		
	
		
	}
	
	
	$item_query = "SELECT clock, value FROM history_uint WHERE itemid = ".$item['id']." AND clock > $clock ORDER BY clock ASC";
	$result = mysql_query($item_query);
	
	
	//$data=array();
	while($row = mysql_fetch_array($result)) {
		
		//normalize times to the nearest minute
		$clock = floatval($row['clock']);
		$clock = $clock - ($clock % 60);
			
		$data[]=array($clock*1000, floatval($row['value']));
		
	
		
	}
	
	//remove trailing domains from hostname
	$hostname = preg_replace("/.demandforce.com|.dfengg.com/", "", $item['hostname']);
	$series[] = array('name'=>$hostname, 'data'=>$data);
	           

}

?>

<!DOCTYPE HTML>
<html>

<head>
<meta http-equiv="refresh" content="60">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<script>

$(document).ready(function() { 

     Highcharts.setOptions({                                            
            // This is for all plots, change Date axis to local timezone
                global : {
                    useUTC : false
                }
            });

    var chart1 = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            type: '<?=$type?>',
            zoomType: 'x'
        },
        title: {
            text: '<?=$key?>'
        },
        xAxis: {
            type: 'datetime',
            title: {
                    text: null
                }
        },
        yAxis: {
            title: {
                text: '<?=$key?>'
            }
        },
        tooltip: {
		        crosshairs: true,
		        shared: false,
		        //valueSuffix: '°C'
		        /*formatter: function() {
		           var s = '<strong>something: '+ this.x +'</strong>';
		
		           var sortedPoints = this.points.sort(function(a, b){
		                 return ((a.y < b.y) ? -1 : ((a.y > b.y) ? 1 : 0));
		             });
		           $.each(sortedPoints , function(i, point) {
		           s += '<br/>'+ point.series.name +': '+ point.y +currency;
		           });
		
		           return s;
				}*/
	    },
        plotOptions: {
                area: {
                    //pointStart: 1940,
                    stacking: 'normal',
                    marker: {
                        enabled: false,
                        symbol: 'circle',
                        radius: 2,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    }
                },
                line: {
                    //pointStart: 1940,
                    marker: {
                        enabled: false,
                        symbol: 'circle',
                        radius: 2,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    }
                },
                areaspline: {
                    //pointStart: 1940,
                    stacking: 'normal',
                    marker: {
                        enabled: false,
                        symbol: 'circle',
                        radius: 2,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    }
                }
            },
        series: <?=json_encode($series)?>
    });
});

</script>

</head>

<body>


<div id="container" style="width:800px; height:400px;"> 

</div>
</body>
</html>
