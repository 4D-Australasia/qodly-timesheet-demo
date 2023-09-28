Class extends Entity

exposed Function setStaff($staff : cs.StaffEntity)
	This.Staff_Id:=$staff.Id

exposed Function setClient($client: cs.ClientEntity)
	trace
	This.Client_Id:=$client.Id
	
	// duration in hours
exposed Function get duration()->$duration : Real
	If ((This.StartTime#Null) & (This.EndTime#Null) & (This.EndTime#"") & (This.StartTime#""))
		$oStart:=ds.Timesheet.fromTimeString(This.StartTime)
		$oEnd:=ds.Timesheet.fromTimeString(This.EndTime)
		
		$lHours:=$oEnd.hours-$oStart.hours
		$lMinutes:=$oEnd.minutes-$oStart.minutes
		If ($lMinutes<0)
			$lHours:=$lHours-1
			$lMinutes:=$lMinutes+60
		End if 
		
		$duration:=$lHours+($lMinutes/60)
		
	Else 
		$duration:=0
	End if 
	
	
exposed Function testSave()->$test : Text
	TRACE
	
	This.save()
	$test:="done"

exposed Function testSave2()->$test:text
	This.save()
	$test:="done2"