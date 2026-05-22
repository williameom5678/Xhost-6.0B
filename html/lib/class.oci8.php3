<?php
/*
 * filename : class.oci8.inc
 * email	: hwooky@phpclass.com
 * homepage : www.phpclass.com
 * author   : hwooky
 */

class DB_Sql {

	var $prvLID = false; // Link ID
	var $prvRID = false; // Result ID(Statement)

	var $Host; // no use
	var $Database; // SID or TNS
	var $User;
	var $Password;
	var $Record; // next_record()로 읽어들인 현재 레코드
	var $NumRows = false;   // SELECT 쿼리에서 얻은 레코드수
	var $NumFields = false; // SELECT 쿼리에서 얻은 필드항목수

	function prvConnect() {
		if (!$this->prvLID)
			$this->prvLID = OCIplogon("$this->User","$this->Password","$this->Database");
	}

	function prvFree() {
		if ($this->prvRID) {
			@OCIFreeStatement($this->prvRID);
			$this->prvRID = false;
			$this->NumRows = $this->NumFields = false;
		}
	}

	function prvNumRows($sql) {
		if (eregi("^[[:space:]]*SELECT[[:space:]]", $sql) ) {
			$from_pos = strpos(strtoupper($sql),"FROM");
			$q = "SELECT count(*) ". substr($sql, $from_pos);
	  
			$stmt = OCIParse($this->prvLID, $q);
			OCIExecute($stmt);
			OCIFetch($stmt);
			return OCIResult($stmt, 1);
		}
	}

	function query($sql) {
		$this->prvFree();
		$this->prvConnect();

		$this->prvRID = OCIParse($this->prvLID, $sql);
		if ($this->prvRID && OCIExecute($this->prvRID,OCI_DEFAULT)) {
			$this->NumRows = $this->prvNumRows($sql);
			$this->NumFields = @OCINumCols($this->prvRID);
		}
	}
  
	function next_record() {
		unset($this->Record);
		if (OCIFetchInto($this->prvRID, $result, OCI_ASSOC+OCI_RETURN_NULLS))
			while(list($k,$v)=each($result))
				$this->Record[strtolower($k)] = $v;
		return $this->Record;
	}
}
?>
