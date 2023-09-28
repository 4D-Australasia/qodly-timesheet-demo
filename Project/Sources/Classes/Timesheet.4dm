Class extends DataClass

exposed Function timesheetSearch($search : Object)->$result : Object
	If (Null($search.from))
		$search.from:=Current date
	End if 
	If (Null($search.to))
		$search.to:=Current date
	End if 
	
	$result:=ds.Timesheet.query("Date >= :1 & Date <= :2"; $search.from; $search.to)
	
	If (Not(Null($search.Staff_Id)))
		$result:=$result.query("Staff_Id = :1"; $search.Staff_Id)
	End if 
	
	If (Not(Null($search.Client_Id)))
		$result:=$result.query("Client_Id = :1"; $search.Client_Id)
	End if 
	
	
exposed Function clearAll()
	ds.Timesheet.all().drop()
	
exposed Function testSave($ts : cs.TimesheetEntity)
	TRACE
	
exposed Function createToday()->$ts : cs.TimesheetEntity
	$ts:=cs.TimesheetEntity.new()
	$ts.Date:=Current date
	
	
	