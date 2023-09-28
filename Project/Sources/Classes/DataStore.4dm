Class extends DataStoreImplementation

exposed Function getUserEmail()->$email : Text
	//$email:=cs.Qodly.Users.getCurrentUser().email
	If (Session:C1714.userName="")
		$email:=Session:C1714.userName
	Else 
		$email:="Guest"
	End if 
	
	
exposed Function formatTime($time : Text)->$result : Time
	var $tTime : Text
	$tTime:=""
	$cSplit:=Split string:C1554($time; ":")
	
	If ($cSplit.length>0)
		$tTime:=String:C10(Num:C11($cSplit[0]))
	End if 
	
	If ($cSplit.length>1)
		$tTime:=$tTime+":"+String:C10(Num:C11($cSplit[1]))
	Else 
		$tTime:=$tTime+":00"
	End if 
	
	If ($cSplit.length>2)
		$tTime:=$tTime+":"+String:C10(Num:C11($cSplit[2]))
	Else 
		$tTime:=$tTime+":00"
	End if 
	
	$result:=Time:C179($tTime)
	
	