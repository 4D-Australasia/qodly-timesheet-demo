Class extends Entity

exposed Function setStaff($staff : cs:C1710.StaffEntity)
	This:C1470.Staff:=$staff
	
	// duration in hours
exposed Function get duration()->$duration : Real
	TRACE:C157
	If ((This:C1470.EndTime#"") & (This:C1470.StartTime#""))
		$oStart:=ds:C1482.Timesheet.fromTimeString(This:C1470.StartTime)
		$oEnd:=ds:C1482.Timesheet.fromTimeString(This:C1470.EndTime)
		
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
	