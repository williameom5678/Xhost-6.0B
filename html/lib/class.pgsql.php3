<?php
/*
 * filename : class.pgsql.inc
 * email	: hwooky@phpclass.com
 * homepage : www.phpclass.com
 * author   : hwooky
 */

class DB_Sql {

	var $prvLID = false; // Link ID
	var $prvRID = false; // Result ID
	var $prvRow = 0;

	var $Host;
	var $Database;
	var $Record; // next_record()로 읽어들인 현재 레코드
	var $NumRows = false;   // SELECT 쿼리에서 얻은 레코드수
	var $NumFields = false; // SELECT 쿼리에서 얻은 필드항목수

	var $Port = "";
	var $Options = "";
	var $Tty = "";

	function prvConnect() {
		if (!$this->prvLID)
			$this->prvLID = pg_pconnect($this->Host, $this->Port, $this->Options, $this->Tty, $this->Database);
	}

	function prvFree() {
		if ($this->prvRID) {
			@pg_FreeResult($this->prvRID);
			$this->prvRID = false;
			$this->NumRows = $this->NumFields = false;
		}
	}
  
	function prvUnsetNumberIndex($arr) {
		$arr=$arr;
		$i = 0;

		while(true) {
			if (isset($arr[$i]))
				unset($arr[$i]);
			else break;
			$i++;
		}
        return $arr;
	}

	function query($sql) {
		$this->prvFree();
		$this->prvConnect();

		if ($this->prvRID = pg_Exec($this->prvLID, $sql)) {
		    $this->prvRow = 0;
			$this->NumRows = @pg_numrows($this->prvRID);
			$this->NumFields = @pg_numfields($this->prvRID);
		}
	}
  
	function next_record() {
		if ($this->prvRow >= $this->NumRows) return false;
		$this->Record = pg_fetch_array($this->prvRID, $this->prvRow++);
		if (is_array($this->Record))
			$this->prvUnsetNumberIndex(&$this->Record);
		return $this->Record;
	}
}
?>
