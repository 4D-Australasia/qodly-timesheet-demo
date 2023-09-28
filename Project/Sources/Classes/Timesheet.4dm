Class extends DataClass

exposed Function timesheetSearch($search : Object)->$result : Object
	If (Null:C1517($search.from))
		$search.from:=Current date:C33
	End if 
	If (Null:C1517($search.to))
		$search.to:=Current date:C33
	End if 
	
	$result:=ds:C1482.Timesheet.query("Date >= :1 & Date <= :2"; $search.from; $search.to)
	
	If (Not:C34(Null:C1517($search.Staff_Id)))
		$result:=$result.query("Staff_Id = :1"; $search.Staff_Id)
	End if 
	
	If (Not:C34(Null:C1517($search.Client_Id)))
		$result:=$result.query("Client_Id = :1"; $search.Client_Id)
	End if 
	
	
exposed Function clearAll()
	ds:C1482.Timesheet.all().drop()
	
exposed Function testSave($ts : cs:C1710.TimesheetEntity)
	TRACE:C157
	
exposed Function createToday()->$ts : cs:C1710.TimesheetEntity
	$ts:=ds:C1482.TimesheetEntity.new()
	$ts.Date:=Current date:C33
	
	
exposed Function fromTimeString($ts : Text)->$timeObj : Object
	//TODO: check parameters
	var $c : Collection
	
	$c:=Split string:C1554($ts; ":")
	$timeObj:=New object:C1471
	$timeObj.hours:=Num:C11($c[0])
	$timeObj.minutes:=Num:C11($c[1])
	
exposed Function toTimeString($h : Text; $m : Text)->$ts : Text
	$ts:=$h+":"+$m
	// test this is synced
	
	