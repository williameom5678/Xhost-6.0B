<?php
/*
 * filename : class.msql.inc
 * email	: hwooky@phpclass.com
 * homepage : www.phpclass.com
 * author   : hwooky
 */

class DB_Sql {

	var $prvLID = false; // Link ID
	var $prvRID = false; // Result ID

	var $Host;
	var $Database;
	var $User; // no use
	var $Password; // no use
	var $Record; // next_record()로 읽어들인 현재 레코드
	var $NumRows = false;   // SELECT 쿼리에서 얻은 레코드수
	var $NumFields = false; // SELECT 쿼리에서 얻은 필드항목수

	function prvConnect() {
		if (!$this->prvLID) {
			$this->prvLID = msql_pconnect($this->Host);
			msql_select_db($this->Database, $this->prvLID);
		}
	}
  
	function prvFree() {
		if ($this->prvRID) {
			@msql_free_result($this->prvRID);
			$this->prvRID = false;
			$this->NumRows = $this->NumFields = false;
		}
	}
  
	function prvUnsetNumberIndex($arr) {
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

		if ($this->prvRID = msql_query($sql, $this->prvLID)) {
			$this->NumRows = @msql_num_rows($this->prvRID);
			$this->NumFields = @msql_num_fields($this->prvRID);
		}
	}

	function next_record() {
		$this->Record = msql_fetch_array($this->prvRID);
		if (is_array($this->Record))
			$this->prvUnsetNumberIndex(&$this->Record);
		return $this->Record;
	}
}
?>
