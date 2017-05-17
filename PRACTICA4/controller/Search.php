<?php
include("../mode/SearchDao.php");
class Search{
    private $dao;

    function __construct(){
        $this->dao = new SearchDao();
    }

    public function generalSearch($keyword){
        return $this->dao->generalSearch($keyword);
    }

    public function userSearch($keyword, $start, $end){
        return $this->dao->userSearch($keyword,$start,$end);
    }

    public function squareSearch($keyword, $start, $end){
        return $this->dao->squareSearch($keyword,$start,$end);
    }
}

?>