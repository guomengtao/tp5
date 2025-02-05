<?php

namespace app\index\model;

use think\Model;
use think\Cookie;
use traits\model\SoftDelete;
use think\Request;

class Footprint extends model
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $autoWriteTimestamp = true;


    protected $auto = [];
    protected $insert = ['ip'];
    protected $update = [];

    public static function views_today()
    {

        return Footprint::whereTime('create_time', 'today')->cache(360)->count();

    }

    public static function views_yesterday()
    {

        return Footprint::whereTime('create_time', 'yesterday')->cache(7200)->count();

    }

    public static function add()
    {

        $user_id = Cookie::get('user_id');

        $request = Request::instance();
        $url     = $request->url();
        $ip      = $request->ip();

        $user          = new Footprint;
        $user->ip      = $ip;
        $user->url     = $url;
        $user->user_id = $user_id;
        $user->save();
    }

    protected function setIpAttr()
    {
        return request()->ip();
    }


    public function setLessonAttr($value)
    {
        return request()->ip();
        return "30";
    }


    public function setAgeAttr($value)
    {
        return "30";
    }

    public function setTitleAttr($value)
    {
        // return request()->ip();
        return $value;
//        return strtolower($value);
    }

    public function setContentAttr($value)
    {
        return $value;
//        return strtolower($value);
    }

    public function getPathAttr($value)
    {
        if ($value == '/') {
            $value = 'index';
        }
        return $value;
    }


    public function getContentAttr($value)
    {
        // $title = [-1=>'删除',0=>'禁用',1=>'正常',2=>'待审核'];
        if ($value) {
            # code...
            return $value;

        }
        return $value;
    }

    public function Ipinfo()
    {
        return $this->hasOne('Ipinfo', 'ip', 'ip');
    }

    public function human()
    {
        return $this->hasOne('Human', 'ip', 'ip');
    }

    public function AgentLink()
    {
        return $this->hasOne('Agent', 'session_id', 'session_id');
    }

    public function Shop()
    {
        return $this->hasOne('Shop', 'id', 'goods_id');
    }

    public function user()
    {
        return $this->hasOne('User', 'id', 'user_id');
    }

}