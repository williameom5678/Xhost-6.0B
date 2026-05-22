<?php

/*
 filename : lib.sessioner.php (ver 0.2.3)
 email	  : hwooky@phpclass.com
 homepage : www.phpclass.com
 author   : hwooky
 environment : PHP3 only
*/

if ("3." != substr(phpversion(), 0, 2)) 
	return;

function sessDestructorExec() {
	global $sessStatic;
	$destructor = "_".$sessStatic->Classname;
	$sessStatic->$destructor();
}
	
class sessStaticAbstract {	// abstract class
	var $Started = false;
	var $Maxlifetime = 1440;// 세션지속시간(초단위)
	var $List = array();
	var $ID;				// 세션 ID
	var $IP;				// $REMOTE_ADDR
	var $Path = "/tmp";
	var $Name = "PHPSESSID";
	var $startedPath;
	var $startedName;
	var $Cookie = array("lifetime"=>0, "path"=>"/", "domain"=>"");
	var $Cache = array("directive"=>"nocache");
	var $ModuleName = "files"; // files | mm | user
	var $nameOpen, $nameClose, $nameRead, $nameWrite, $nameDestroy, $nameGc;
	
	function sessStaticAbstract() {
		$this->prvCacheLimiter("nocache");
	}

	function _sessStaticAbstract() {
		$this->prvEndExec();
	}

	function prvHandlerExec($handle, $arg1="", $arg2="") {
		$value = "";
		if ("files" == $this->ModuleName) {
			$method = "sessHdl$handle";
			$value = $this->$method($arg1, $arg2);
		} else if ("user" == $this->ModuleName) {
			$property = "name$handle";
			if (function_exists($nameRead = $this->$property))
				$value = $nameRead($arg1, $arg2);
		}
		return $value;
	}

	function prvNextExec() {
		if ($value=$this->prvHandlerExec("Read", $this->ID))
			if ($this->IP == $this->prvDecode($value))
				return true;
		return false;
	}

	function prvEndExec() {
		if ($this->Started) {
			$this->prvHandlerExec("Write", $this->ID, $this->prvEncode());
			$this->prvHandlerExec("Close");
		}
	}

	function prvDecode($value) {
		$pos = strpos($value, "|");
		$ip = substr($value, 0, $pos);
		$list = unserialize(substr($value, $pos+1));
		$this->List = array();
		$this->prvResetVars();
		if (is_array($list)) {
			reset($list);
			while (list($varname,$value)=each($list)) {
				if (!is_string($value) || $value)
					$this->prvPutVars($varname, $value);
				$this->List[$varname] = true;
			}
		}
		return $ip;
	}

	function prvEncode() {
		$list = array();
		reset($this->List);
		while (list($varname,$flag)=each($this->List))
			if ($flag)
				$list[$varname] = $this->prvGetVars($varname);
		return $this->IP."|".serialize($list);
	}

	function prvStart() {
		if ("user" == $this->ModuleName && !$this->nameOpen) {
			print "<P><B>Fatal error</B>: Failed to initialize session module in session_start()<BR>\n";
			exit;
		}

		if (!$this->Started) {
			$this->Started = true;
			$this->startedPath = $this->Path;
			$this->startedName = $this->Name;

			if (!$this->ID)
				$this->ID = $this->prvGetID($this->startedName, $this->Cookie);
			
			$this->prvCacheControl();
			$this->prvHandlerExec("Open", $this->Path, $this->Name);
			$this->IP = getenv(REMOTE_ADDR);
			$this->prvHandlerExec("Gc", $this->Maxlifetime);

			if (!$this->prvNextExec()) {	
				$this->List = array(); // 최초로 접근할 때만 수행해야 하는 부분
				$this->prvResetVars();
			}
		}
		return true;
	}

	function prvDestroy() {
		if (!$this->Started) {
			print "<P><B>Warning</B>: Trying to destroy uninitialized session......<BR>\n";
			return false;
		}
		$this->Started = false;
		$this->List = array();
		$this->prvResetVars();
		$this->prvHandlerExec("Destroy", $this->ID);
		$this->prvHandlerExec("Close");
		$this->nameOpen = $this->nameClose = $this->nameRead = $this->nameWrite = $this->nameDestroy = $this->nameGc = "";

		return true;
	}

	function prvRegister($varlist) {
		if (!$this->Started)
			$this->prvStart();
		if (is_string($varlist))
			$varlist = explode(",", ereg_replace("[[:space:]]+", "", $varlist));
		if (is_array($varlist))
			while (list(,$varname)=each($varlist))
				if ($varname)
					$this->List[$varname] = true;
		return true;
	}

	function prvUnregister($varlist, $varname="") {
		if ("" != $varname) {
			print "<P><B>Warning</B>: Unsupported variable_length argument list......<BR>\n";
			return false;
		}
		if (is_string($varlist))
			$varlist = explode(",", ereg_replace("[[:space:]]+", "", $varlist));
		if (is_array($varlist))
			while (list(,$varname)=each($varlist))
				if ($varname)
					$this->List[$varname] = false;
		return true;
	}

	function prvUnset() {
		reset($this->List);
		while (list($varname,$flag)=each($this->List))
			if ($flag)
				$this->prvUnsetVars($varname);
	}

	function prvCacheControl() {
		header($this->Cache["msg1"]);
		header($this->Cache["msg2"]);
		header($this->Cache["msg3"]);
	}

	function prvCacheValue($maxage=10800) {
		switch ($this->Cache["directive"]) {
			case "nocache" :
				$this->Cache["msg1"] = "expires: Thu, 19 Nov 1981 08:52:00 GMT";
				$this->Cache["msg2"] = "cache-control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0";
				$this->Cache["msg3"] = "pragma: no-cache";
				break;
			case "private" :
				$this->Cache["msg1"] = "expires: Thu, 19 Nov 1981 08:52:00 GMT";
				$this->Cache["msg2"] = "cache-control: private, max-age=$maxage, pre-check=$maxage";
				$this->Cache["msg3"] = "last-modified: ".gmdate("D, j M Y H:i:s", time() - 896)." GMT";
				break;
			case "public" :
				$this->Cache["msg1"] = "expires: ".gmdate("D, j M Y H:i:s", time() + 3600*3)." GMT";
				$this->Cache["msg2"] = "cache-control: public, max-age=$maxage";
				$this->Cache["msg3"] = "last-modified: ".gmdate("D, j M Y H:i:s", time() - 896)." GMT";
				break;
		}
	}

	function prvCacheLimiter($limiter="") {
		$old = $this->Cache["directive"];
		if (!is_string($limiter) || "" != $limiter) {
			$this->Cache["directive"] = $limiter;
			$this->prvCacheValue();
		}
		return $old;
	}

	function prvSetSaveHandler($open, $close, $read, $write, $destroy, $gc) {
		if (function_exists($open)
				&& function_exists($close)
				&& function_exists($read)
				&& function_exists($write)
				&& function_exists($destroy)
				&& function_exists($gc)) {
			$this->ModuleName = "user";
			$this->nameOpen = $open;
			$this->nameClose = $close;
			$this->nameRead = $read;
			$this->nameWrite = $write;
			$this->nameDestroy = $destroy;
			$this->nameGc = $gc;
		}
	}

	function prvProperty($name, $new="") {
		$old = $this->$name;
		if (!is_string($new) || "" != $new) {
			$this->$name = $new;
			if ("ModuleName" == $name) {
				if ("files" == $new) {
					$this->prvHandlerExec("Close");
				}
				$this->nameOpen = $this->nameClose = $this->nameRead = $this->nameWrite = $this->nameDestroy = $this->nameGc = "";
			}
		}
		return $old;
	}

	function prvCookie($lifetime="", $path="", $domain="") {
		if (is_string($lifetime) && "" == lifetime)
			return $this->Cookie;
		$this->Cookie["lifetime"] = $lifetime;
		if ("" != $path)
			$this->Cookie["path"] = $path;
		if ("" != $domain)
			$this->Cookie["domain"] = $domain;
		$this->prvSetCookie();
	}

	function prvList($varname="", $value="") {
		if (is_string($varname) && "" == $varname)
			return $this->List;
		if (is_string($value) && "" == $value)
			return $this->List[$varname];
		$this->List[$varname] = $value;
	}

	//
	// abstract function
	//

	function prvGetID($name, $cookie) {}
	function prvSetID($name, $id, $cookie) {}

	function prvResetVars() {}
	function prvUnsetVars($varname) {}
	function prvGetVars($varname) {}
	function prvPutVars($varname, $value) {}

	function sessHdlOpen($save_path, $name) {}
	function sessHdlClose() {}
	function sessHdlRead($id) {}
	function sessHdlWrite($id, $data) {}
	function sessHdlDestroy($id) {}
	function sessHdlGc($maxlifetime) {}
}

class sessStaticVars extends sessStaticAbstract {
	function sessStaticVars() {
		$this->sessStaticAbstract();
	}

	function _sessStaticVars() {
		$this->_sessStaticAbstract();
	}

	function prvGetID($name, $cookie) {
		if (!($id = $GLOBALS["HTTP_COOKIE_VARS"][$name])) {
			$id = md5(uniqid(""));
			SetCookie($name, $id, $cookie["lifetime"], $cookie["path"], $cookie["domain"]);
		}
		return $id;
	}

	function prvResetVars() {
		$GLOBALS["HTTP_SESSION_VARS"] = array();
	}

	function prvUnsetVars($varname) {
		unset($GLOBALS[$varname]);
	}

	function prvGetVars($varname) {
		return isset($GLOBALS[$varname]) ? $GLOBALS[$varname] : "";
	}

	function prvPutVars($varname, $value) {
		$GLOBALS[$varname] = $GLOBALS["HTTP_SESSION_VARS"][$varname] = $value;
	}
}

class sessStatic extends sessStaticVars {
	var $Classname = "sessStatic";

	function sessStatic() {
		$this->sessStaticVars();
		register_shutdown_function("sessDestructorExec");
	}

	function _sessStatic() {
		$this->_sessStaticVars();
	}

	function sessHdlOpen($save_path, $name) {
		$GLOBALS["error"][] = "i_open($save_path, $name)";
		return true;
	}

	function sessHdlClose() {
		$GLOBALS["error"][] = "i_close()";
		return true;
	}

	function sessHdlRead($id) {
		$GLOBALS["error"][] = "i_read($id)";
		$sess_file = $this->Path."/sess_$id";
		if ($fp = @fopen($sess_file, "r")) {
			$data = fread($fp, filesize($sess_file));
			return $data;
		} else {
			return "";
		}
	}

	function sessHdlWrite($id, $data) {
		echo "i_write($id, $data)<BR>";

		$GLOBALS["error"][] = "i_write($id, $data)";
		$sess_file = $this->Path."/sess_$id";
		if ($fp = @fopen($sess_file, "w")) {
			return fwrite($fp, $data);
		} else {
			return false;
		}
	}

	function sessHdlDestroy($id) {
		$GLOBALS["error"][] = "i_destroy($id)";
		$sess_file = $this->Path."/sess_$id";
		return @unlink($sess_file);
	}

	function sessHdlGc($maxlifetime) {
		$GLOBALS["error"][] = "i_gc($maxlifetime)";
		$handle = opendir($this->Path);
		while ($file=readdir($handle)) {
			if ("sess_" == substr($file, 0, 5)) {
				$sess_file = $this->Path."/".$file;
				if (time() > filemtime($sess_file)+$maxlifetime) {
					unlink($sess_file);
				}
			}
		}
		closedir($handle);
		return true;
	}
}

//
// $sessStatic 객체 생성
//

$sessStatic = new sessStatic;

//
// PHP4 세션함수와 호환성을 가진 함수들
//

function session_start() {
	return $GLOBALS["sessStatic"]->prvStart();
}

function session_destroy() {
	 return $GLOBALS["sessStatic"]->prvDestroy();
}

function session_register($varname) {
	return $GLOBALS["sessStatic"]->prvRegister($varname);
}

function session_unregister($varname) {
	return $GLOBALS["sessStatic"]->prvUnregister($varname);
}

function session_unset() {
	$GLOBALS["sessStatic"]->prvUnset();
}

function session_name($new="") {
	return $GLOBALS["sessStatic"]->prvProperty("Name", $new);
}

function session_save_path($new="") {
	return $GLOBALS["sessStatic"]->prvProperty("Path", $new);
}

function session_id($new="") {
	return $GLOBALS["sessStatic"]->prvProperty("ID", $new);
}

function session_is_registered($varname) {
	return $GLOBALS["sessStatic"]->prvList($varname);
}

function session_get_cookie_params() {
	return $GLOBALS["sessStatic"]->prvCookie();
}

function session_set_cookie_params($lifetime, $path="", $domain="") {
	$GLOBALS["sessStatic"]->prvCookie($lifetime, $path, $domain);
}

function session_cache_limiter($limiter="") {
	return $GLOBALS["sessStatic"]->prvCacheLimiter($limiter);
}

function session_set_save_handler($open, $close, $read, $write, $destroy, $gc) {
	return $GLOBALS["sessStatic"]->prvSetSaveHandler($open, $close, $read, $write, $destroy, $gc);
}

function session_module_name($new="") {
	return $GLOBALS["sessStatic"]->prvProperty("ModuleName", $new);
}

//
// PHP4 세션함수와 호환성없는 함수들
// 파일 내용을 직접 다루지 않으면 PHP4 세션함수와 호환됨
//

function session_decode($value) {
	return $GLOBALS["sessStatic"]->prvDecode($value);
}

function session_encode() {
	return $GLOBALS["sessStatic"]->prvEncode();
}

//
// PHP4 세션함수와 관계없는 함수들
//

function session_gc_maxlifetime() {
	return $GLOBALS["sessStatic"]->prvProperty("Maxlifetime");
}

?>