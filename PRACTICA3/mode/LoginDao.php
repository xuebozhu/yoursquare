<?php
include("MySQLFunctions.php");
class LoginDao(){
  private $user;
  private $pass;
  function __construct($username,$password){
    $this->user = $username;
    $this->pass = $password;
  }
  public function doLogin(){
    $sql = new MySQLConnect();
    $sql->select("select * from usuarios","user_username='$this->user' and user_password='$this->pass'");
    if($sql->response["status"] && count($sql->response["data"]) > 0){
      return true;
    }else{
      return false;
    }
  }
}

?>
