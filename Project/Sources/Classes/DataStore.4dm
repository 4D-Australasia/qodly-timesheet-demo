Class extends DataStoreImplementation

exposed Function getUserEmail()->$email : Text
	//$email:=cs.Qodly.Users.getCurrentUser().email
	If (Session.userName="")
		$email:=Session.userName
	Else 
		$email:="Guest"
	End if 
	
	
exposed Function formatTime($time : Text)->$result : Time
	var $tTime : Text
	$tTime:=""
	$cSplit:=Split string($time; ":")
	
	If ($cSplit.length>0)
		$tTime:=String(Num($cSplit[0]))
	End if 
	
	If ($cSplit.length>1)
		$tTime:=$tTime+":"+String(Num($cSplit[1]))
	Else 
		$tTime:=$tTime+":00"
	End if 
	
	If ($cSplit.length>2)
		$tTime:=$tTime+":"+String(Num($cSplit[2]))
	Else 
		$tTime:=$tTime+":00"
	End if 
	
	$result:=Time($tTime)
	
exposed Function trace()
	Trace