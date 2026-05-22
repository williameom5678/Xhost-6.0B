<?php
/*
 * filename : class.oracle.inc
 * email	: hwooky@phpclass.com
 * homepage : www.phpclass.com
 * author   : hwooky
 */

class DB_Sql {

	var $prvLID = false; // Link ID
	var $prvRID = false; // Result ID(Cursor Index)

	var $Host;
	var $Database; // SID or TNS
	var $User;
	var $Password;
	var $Record; // next_record()로 읽어들인 현재 레코드
	var $NumRows = false;   // SELECT 쿼리에서 얻은 레코드수
	var $NumFields = false; // SELECT 쿼리에서 얻은 필드항목수

	function prvConnect() {
		if (!$this->prvLID) {
			if ("localhost" != strtolower($this->Host))
				$this->User .= "@".$this->Database;
			$this->prvLID = ora_plogon("$this->User","$this->Password");
			ora_commitoff($this->prvLID);
		}
	}

	function prvFree() {
		if ($this->prvRID) {
			@ora_close($this->prvRID);
			$this->prvRID = false;
			$this->NumRows = $this->NumFields = false;
		}
	}
  
	function prvNumRows($sql) {
		if (eregi("^[[:space:]]*SELECT[[:space:]]", $sql) ) {
			$from_pos = strpos(strtoupper($sql),"FROM");
			$q = "SELECT count(*) ". substr($sql, $from_pos);
	  
			$curs=ora_open($this->prvLID);
			ora_parse($curs,$q);
			ora_exec($curs);
			ora_fetch($curs);
			$numrows = ora_getcolumn($curs, 0);
			ora_close($curs);
			return($numrows);
		}
	}

	function query($sql) {
		$this->prvFree();
		$this->prvConnect();

		if ($this->prvRID = ora_open($this->prvLID)) {
			ora_parse($this->prvRID, $sql);
			ora_exec($this->prvRID);
			$this->NumRows = $this->prvNumRows($sql);
			$this->NumFields = @ora_numcols($this->prvRID);
		}
	}
  
	function next_record() {
		unset($this->Record);
		if (ora_fetch($this->prvRID))
			for($i=0;$i<ora_numcols($this->prvRID);$i++) {
				$col = strtolower(ora_columnname($this->prvRID, $i));
				$this->Record["$col"] = ora_getcolumn($this->prvRID, $i);
			}
		return $this->Record;
	}
}
?>
