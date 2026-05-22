<?

function select_year()
{
	$toyear=date("Y");
		 
	 for ($y=$toyear-3; $y<$toyear+5 ; $y++) 
	{
		
		if ($y==$toyear) 	{$date_year.="<option value='$y' selected>$y 년</option>\n";	}
		else			 		{$date_year.="<option value='$y'>$y 년</option>\n";	}
		
	}
return $date_year;
	
 }


function by_year($year)
{
	$toyear=$year;
		 
	 for ($y=$toyear-3; $y<$toyear+5 ; $y++) 
	{
		
		if ($y==$toyear) 	{$date_year.="<option value='$y' selected>$y 년</option>\n";	}
		else			 		{$date_year.="<option value='$y'>$y 년</option>\n";	}
		
	}

return $date_year;
	
 }


 function select_month()
 {
	
	$tomonth=date("m");
	for ($m=1;$m<=12 ; $m++) 
	{
		
		$mm=($m<10) ? "0".$m:$m;
		if ($m==$tomonth) 	{$date_month.="<option value='$mm' selected>$m 월</option>\n";	}
		else			 			{$date_month.="<option value='$mm'>$m 월</option>\n";	}
	
	}
return $date_month ;
}

 function by_month($month)
 {
	
	$tomonth=$month;
	for ($m=1;$m<=12 ; $m++) 
	{
		
		$mm=($m<10) ? "0".$m:$m;
		if ($m==$tomonth) 	{$date_month.="<option value='$mm' selected>$m 월</option>\n";	}
		else			 			{$date_month.="<option value='$mm'>$m 월</option>\n";	}
	
	}
return $date_month ;
}
 

function select_day()
{
	$today=date("d");
	for ($d=1 ; $d<=31  ; $d++) 
	{
		
		if ($d==$today)  {$date_day.="<option value='$d' selected>$d 일</option>\n"; }
		else					{$date_day.="<option value='$d'>$d 일</option>\n";				 }
	
	}

return $date_day;
}

function by_day($day)
{
	$today=$day;
	for ($d=1 ; $d<=31  ; $d++) 
	{
		
		if ($d==$today)  {$date_day.="<option value='$d' selected>$d 일</option>\n"; }
		else					{$date_day.="<option value='$d'>$d 일</option>\n";				 }
	
	}

return $date_day;
}

function select_time()

{
	$date_time="<option value=''>시간설정없음</option>";
	for ($t=6; $t<=22 ; $t++) 
	{
		if ($t <= 12)	{	$date_time.="<option value='$t'>$t 시 AM</option>\n";	}
		else 				{	$tt = $t-12;
								$date_time.="<option value='$t'>$tt 시 PM</option>\n";	}
		
		
	 }

return $date_time;
}

function by_time($time)

{
	for ($t=6; $t<=22 ; $t++) 
	{
		if ($t==$time) 
		{
		
		
				if ($t <= 12)	{	$date_time.="<option value='$t' selected>$t 시 AM</option>\n";	}
				else 				{	$tt = $t-12;
										$date_time.="<option value='$t' selected>$tt 시 PM</option>\n";	}
		}
		else 
		{	
				if ($t <= 12)	{	$date_time.="<option value='$t'>$t 시 AM</option>\n";	}
				else 				{	$tt = $t-12;
										$date_time.="<option value='$t'>$tt 시 PM</option>\n";	}
		

		}

	 }

return $date_time;
}

function calen($year,$month,$day) // 년에서 해당월에 달력을 표시하는 루틴 
{

// 해당년월의 처음 요일을 구한다.
$timestamp= mktime(0,0,0,$month,1,$year);
$month_first_week = date("w",$timestamp); 

//해당년월의 마지막 날을 구한다
for ($ld=27; checkdate($month,$ld,$year) ; $ld++)
{}
$month_last_day=$ld-1;


$time_table="<table align='center' border='0' cellspacing='0'>
			<tr>
			<td  colspan='7' bgcolor='#99CCFF'>
            <p align='center'><a href='month.php3?year=$year&month=$month&day=$day'>
			<font size='2' class='noline' color='black'> $month 월</font></a></p>
			</td>
		
		</tr>
		<tr bgcolor='#B6E1FA'>
        <td   width='17'>
            <p align='center'><font size='2' color='red'>일</font></p>
        </td>
        <td    width='17'>
            <p align='center'><font size='2' color='black'>월</font></p>
        </td>
        <td    width='17'>
            <p align='center'><font size='2' color='black'>화</font></p>
        </td>
        <td    width='17'>
            <p align='center'><font size='2' color='black'>수</font></p>
        </td>
        <td    width='17'>
            <p align='center'><font size='2' color='black'>목</font></p>
        </td>
        <td    width='17'>
            <p align='center'><font size='2' color='black'>금</font></p>
        </td>
        <td    width='17'>
            <p align='center'><font size='2' color='blue'>토</font></p>
        </td>
    </tr>
	";

//실제의 달력 표시
$date = 1; // 처음 시작하는 날짜
for ($uu=0;$uu<6;$uu++) 
{	$time_table.="<tr height='18'>";
	for ($w=0 ; $w<7 ; $w++) 
	{		if ($w==0)       	{ $tcolor = "red";	}
			elseif ($w==6) 	{ $tcolor = "blue";	}
			else 					{ $tcolor= "#000000";  }

//첫줄에서 해당요일이아직 표시 되지 않았을때와 마지막	날짜보다 클때에 공백표시 

			if ( ($w<$month_first_week && !$week_row) || $date >$month_last_day ) 
			{ $time_table.="<td valign='top' bgcolor='#FFFFFF' height='18'><font color='white' size='1'>b</font></td>";}				 
			else																								 
			{ $time_table.="<td align='center' bgcolor='#EBF6FC' align='center' height='18'>
			<font color='$tcolor' size='1'>$date</font></td>"; $date++;	}
	}
	$week_row++;
	$time_table.="</tr>";
}

$time_table.="</table>";

return $time_table;

} //function end



function m_table($year,$month)
{

$timestamp= mktime(0,0,0,$month,1,$year);
$month_first_week = date("w",$timestamp); 
for ($ld=27; checkdate($month,$ld,$year) ; $ld++){}
$month_last_day=$ld-1;
$time_table="<table align='center'  cellspacing='0' width='100%' border='0' cellpadding='0'>

		<tr bgcolor='#B6E1FA'>
        <td height='20' align='center'><font size='1' color='red'>S</font></td>
        <td  align='center'><font size='1' color='black'>M</font></td>
        <td  align='center'><font size='1' color='black'>T</font></td>
		<td  align='center'><font size='1' color='black'>W</font></td>
        <td  align='center'><font size='1' color='black'>T</font></td>
		<td  align='center'><font size='1' color='black'>F</font></td>
        <td  align='center'><font size='1' color='blue'>S</font></td></tr>";
$date = 1; 
while ($date<=$month_last_day) 
{	$time_table.="<tr>";
	for ($w=0 ; $w<7 ; $w++) 
	{		if ($w==0)       	{ $tcolor = "red";	}
			elseif ($w==6) 	{ $tcolor = "blue";	}
			else 					{ $tcolor= "#000000";  }

//첫줄에서 해당요일이아직 표시 되지 않았을때와 마지막	날짜보다 클때에 공백표시 

			if ( ($w<$month_first_week && !$week_row) || $date >$month_last_day ) 
			{ $time_table.="<td height='20' valign='top' bgcolor='#FFFFFF'>&nbsp</td>";}				 
			else																								 
			{ $time_table.="<td height='20' align='center' bgcolor='#EBF6FC' align='center'>
			<a href='day.php3?year=$year&month=$month&day=$date'><font color='$tcolor' size='1'>$date</font></a></td>"; $date++;	}
	}
	$week_row++;
	$time_table.="</tr>";
}
$time_table.="</table>";
return $time_table;
}// end functiion

 
 ?>