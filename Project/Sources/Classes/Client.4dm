Class extends DataClass

exposed Function test1($name : Text)->$res : cs.ClientEntity
	var $client : cs.ClientEntity
	$client:=cs.Client.new()
	$client.name:=$name
	$client.save()
	
	return $client
	